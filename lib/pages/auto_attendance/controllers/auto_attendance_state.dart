import 'dart:async';
import 'dart:typed_data';

import 'package:a_check/globals.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/pages/auto_attendance/auto_attendance_page.dart';
import 'package:a_check/utils/attendance_helpers.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:a_check/utils/face_ml_helpers.dart';
import 'package:a_check/utils/mlservice.dart';
import 'package:a_check/utils/onvif_helpers.dart';
import 'package:a_check/widgets/correct_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:image/image.dart' as imglib;
import 'package:ml_algo/kd_tree.dart';

class RecognizedStudent {
  Student student;
  num distance;
  imglib.Image faceImage;
  bool locked = false;

  late int occurences;

  RecognizedStudent(
      {required this.student,
      required this.distance,
      required this.faceImage,
      int? occurences}) {
    this.occurences = occurences ?? 1;
  }

  Uint8List get jpegBytes {
    return imglib.encodeJpg(faceImage, quality: 50);
  }
}

class AutoAttendanceState extends State<AutoAttendancePage> {
  VlcPlayerController? vlcController;
  Map<String, RecognizedStudent> recognizedStudents = {};
  bool isTakingScreenshots = true;

  @override
  Widget build(BuildContext context) => AutoAttendanceView(this);

  @override
  void initState() {
    super.initState();

    _setupClassList();
  }

  @override
  void dispose() {
    super.dispose();

    _mlService.dispose();
    if (vlcController != null) vlcController?.dispose();
  }

  Future<String?> connectToCamera() async {
    try {
      return await OnvifHelpers.getCameraStreamUri();
    } on OnvifException catch (ex) {
      snackbarKey.currentState!
          .showSnackBar(SnackBar(content: Text(ex.message ?? "Error! $ex")));
      Navigator.pop(context);
    }

    return null;
  }

  final MLService _mlService = MLService();
  late final List<Student> _classStudents, _registeredStudents;
  late final KDTree _faceEmbeddings;

  _setupClassList() async {
    _classStudents = await widget.schoolClass.getStudents();
    _registeredStudents = [
      for (var student in _classStudents)
        if (student.faceArray.isNotEmpty) student
    ];

    List<List<num>> embeddings = [
      for (Student student in _registeredStudents) student.faceArray.cast<num>()
    ];
    _faceEmbeddings = KDTree.fromIterable(embeddings);
  }

  onFrame(Uint8List frameBytes) async {
    final inputImage = await FaceMLHelpers.bytesToInputImage(frameBytes);
    final faceImages =
        await FaceMLHelpers.getFaceImagesFromInputImage(inputImage, _mlService);

    for (var face in faceImages) {
      final map =
          await FaceMLHelpers.recognizeFace(face, _faceEmbeddings, _mlService);

      if (map != null) {
        final student = _registeredStudents[map['index']! as int];
        final distance = map['distance']!;

        if (!context.mounted) return;
        setState(() {
          RecognizedStudent? rs;
          if (recognizedStudents.containsKey(student.id)) {
            rs = recognizedStudents[student.id]!;

            if (rs.locked) {
              return;
            }

            if (distance > rs.distance) {
              // ignore this
              return;
            }
            rs.distance = distance;
            rs.faceImage = face;
            rs.occurences++;
          }

          recognizedStudents[student.id] = rs ??
              RecognizedStudent(
                  student: student,
                  distance: distance,
                  faceImage: face,
                  occurences: recognizedStudents[student.id]?.occurences);
        });
      }
    }
  }

  correction(RecognizedStudent rs) async {
    setState(() {
      isTakingScreenshots = false;
    });

    final result = await showDialog(
      context: context,
      builder: (context) => CorrectDialog(
        students: _classStudents,
      ),
    );

    if (result != null) {
      if (result == false) {
        setState(() {
          recognizedStudents.remove(rs.student.id);
        });
        return;
      }

      final oldStudent = rs.student;
      final Student newStudent = result;
      rs.student = newStudent;
      rs.locked = true;

      setState(() {
        recognizedStudents.remove(oldStudent.id);
        recognizedStudents[newStudent.id] = rs;
      });
    }
  }

  void finalize() async {
    final bool? result = await Dialogs.showConfirmDialog(
        context,
        const Text("Finalize attendance"),
        const Text("Recognized students will be set as present. Continue?"));

    if (result == true) {
      AttendanceHelpers.recordAttendance(
              classId: widget.schoolClass.id,
              classStudents: _classStudents,
              recognizedStudents:
                  recognizedStudents.values.map((e) => e.student).toList())
          .then((_) {
        snackbarKey.currentState!.showSnackBar(SnackBar(
            content: Text(
                "Took attendances of ${recognizedStudents.length} student${recognizedStudents.length > 1 ? 's' : ''}")));
        Navigator.pop(context);
      });
    }
  }

  void toggleCapture() {
    setState(() {
      isTakingScreenshots = !isTakingScreenshots;
    });
  }
}
