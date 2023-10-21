import 'dart:io';

import 'package:a_check/globals.dart';
import 'package:a_check/main.dart';
import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/models/student.dart';
import 'package:a_check/pages/take_attendance_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:a_check/utils/mlservice.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as imglib;
import 'package:ml_algo/kd_tree.dart';
import 'package:path_provider/path_provider.dart';

class TakeAttendanceState extends State<TakeAttendancePage> {
  final MLService _mlService = MLService();
  bool isUsingIPCamera = false;

  void showSnackBar(Widget widget) {
    snackbarKey.currentState!.hideCurrentSnackBar();
    snackbarKey.currentState!.showSnackBar(SnackBar(content: widget));
  }

  void switchCamera() {
    setState(() => isUsingIPCamera = !isUsingIPCamera);
  }

  void processScreenshot(Uint8List screenshot) async {
    showSnackBar(const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Capturing screenshot..."),
        CircularProgressIndicator()
      ],
    ));
    final tempDir = await getTemporaryDirectory();
    final file = await File("${tempDir.path}/screenshot.jpg").create();
    file.writeAsBytesSync(screenshot);
    final xfile = XFile(file.path);

    processCapturedImage(xfile);
  }

  // TODO: Orientation detection
  void processCapturedImage(XFile photoXFile) async {
    final photoFile = File(photoXFile.path);
    final inputImage = InputImage.fromFile(photoFile);

    showSnackBar(const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: CircularProgressIndicator(),
        ),
        Text("Recognizing faces...")
      ],
    ));
    final faces = await _mlService.getFaces(inputImage);
    if (faces.isEmpty) {
      if (!context.mounted) return;
      showSnackBar(const Text("Heyo, we got no faces!"));
      return;
    }

    final faceImages = await _mlService.getFaceImages(faces, photoFile);

    List<Student> classStudents = widget.mClass.getStudents();
    List<Student> studentsWithRegisteredFaces = [
      for (var student in classStudents)
        if (student.faceArray != null) student
    ];
    List<List<num>> embeddings = [
      for (var student in studentsWithRegisteredFaces) student.faceArray!.cast()
    ];
    final tree = KDTree.fromIterable(embeddings);

    Map<Student, num> recognizedStudents = {};
    for (imglib.Image image in faceImages) {
      List predictedArray = await _mlService.predict(image);
      var neighbor = tree.queryIterable(predictedArray.cast(), 1);
      if (kDebugMode) {
        print(neighbor);
      }

      final threshold = prefs.getDouble('threshold')!;
      if (neighbor.first.distance <= threshold) {
        final student =
            studentsWithRegisteredFaces.elementAt(neighbor.first.index);

        if (kDebugMode) {
          print(
              "recognized $student with distance of ${neighbor.first.distance}");
        }
        recognizedStudents.addAll({student: neighbor.first.distance});
      }
    }

    if (recognizedStudents.isEmpty) {
      if (!context.mounted) return;
      showSnackBar(const Text("Heyo, we recognized no one!"));
      return;
    }

    final currentDateTime = DateTime.now();
    for (Student student in classStudents) {
      AttendanceRecord record;
      if (recognizedStudents[student] != null) {
        record = AttendanceRecord(
            studentId: student.id,
            classKey: widget.mClass.key,
            dateTime: currentDateTime,
            status: AttendanceStatus.present);
      } else {
        record = AttendanceRecord(
            studentId: student.id,
            classKey: widget.mClass.key,
            dateTime: currentDateTime,
            status: AttendanceStatus.absent);
      }

      HiveBoxes.attendancesBox().add(record);
    }

    if (context.mounted) {
      await Dialogs.showAlertDialog(
        context,
        const Text("Recognized students"),
        Text(recognizedStudents.entries
            .map((e) => "${e.key.toString()} (${e.value.toStringAsFixed(3)})")
            .cast<String>()
            .toList()
            .join('\n')),
      );
    }
    if (context.mounted) {
      snackbarKey.currentState!.hideCurrentSnackBar();
      Navigator.pop(context);
    }
  }

  Future<bool> onWillPop() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return true;
  }

  @override
  Widget build(BuildContext context) => TakeAttendanceView(this);

    @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
