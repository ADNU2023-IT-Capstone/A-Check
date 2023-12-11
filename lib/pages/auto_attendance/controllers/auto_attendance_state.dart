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
import 'package:ml_algo/kd_tree.dart';

import '../../../models/recognized_student.dart';

class AutoAttendanceState extends State<AutoAttendancePage> {
  late Future<void> waitForSetup;
  Map<String, RecognizedStudent> recognizedStudents = {};
  bool isTakingScreenshots = true;

  @override
  Widget build(BuildContext context) => AutoAttendanceView(this);

  @override
  void initState() {
    super.initState();

    waitForSetup = _setupClassList();
  }

  @override
  void dispose() {
    super.dispose();

    _mlService.dispose();
  }

  Future<String?> connectToCamera() async {
    try {
      return await OnvifHelpers.getCameraStreamUri();
    } on OnvifException catch (ex) {
      snackbarKey.currentState!
          .showSnackBar(SnackBar(content: Text(ex.message ?? "Error! $ex")));
      if (mounted) Navigator.pop(context);
    }

    return null;
  }

  final _mlService = MLService();
  late final List<Student> _classStudents, _registeredStudents;
  late final KDTree _faceEmbeddings;

  Future<void> _setupClassList() async {
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
    // get input image and its face images
    final inputImage = await FaceMLHelpers.bytesToInputImage(frameBytes);
    final faceImages =
        await FaceMLHelpers.getFaceImagesFromInputImage(inputImage, _mlService);

    // if no face detected, do nothing
    if (faceImages.isEmpty) {
      return;
    }

    // iterate through face images...
    for (var face in faceImages) {
      // run recognition
      final faceMap =
          await FaceMLHelpers.recognizeFace(face, _faceEmbeddings, _mlService);

      // ...if it recognized a person
      if (faceMap != null) {
        final student = _registeredStudents[faceMap['index']! as int];
        final distance = faceMap['distance']!;

        RecognizedStudent? rs;
        if (recognizedStudents.containsKey(student.id)) {
          rs = recognizedStudents[student.id]!;

          if (rs.locked) {
            // already corrected; ignore
            continue;
          }

          if (distance > rs.distance) {
            // distance too far; ignore
            continue;
          }
          rs.distance = distance;
          rs.faceImage = face;
          rs.occurences++;
        }

        // ...add to recognized students map if widget is mounted
        if (mounted) {
          setState(() {
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
      snackbarKey.currentState!.showSnackBar(const SnackBar(
          content: Row(children: [
        CircularProgressIndicator(),
        SizedBox(width: 16),
        Text("Saving...")
      ])));
      AttendanceHelpers.recordAttendance(
              schoolClass: widget.schoolClass,
              classStudents: _classStudents,
              recognizedStudents:
                  recognizedStudents.values.map((e) => e.student).toList())
          .whenComplete(() {
        snackbarKey.currentState!.removeCurrentSnackBar();
        snackbarKey.currentState!
            .showSnackBar(const SnackBar(content: Text("Saved to firebase!")));
      });

      snackbarKey.currentState!.showSnackBar(SnackBar(
          content: Text(
              "Took attendances of ${recognizedStudents.length} student${recognizedStudents.length > 1 ? 's' : ''}")));
      if (mounted) Navigator.pop(context);
    }
  }

  void toggleCapture() {
    setState(() {
      isTakingScreenshots = !isTakingScreenshots;
    });
  }
}
