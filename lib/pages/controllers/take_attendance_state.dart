import 'dart:io';

import 'package:a_check/models/student.dart';
import 'package:a_check/pages/take_attendance_page.dart';
import 'package:a_check/utils/mlservice.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as imglib;

class TakeAttendanceState extends State<TakeAttendancePage> {
  final MLService _mlService = MLService();

  void showSuccessDialog(List<Student> student) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Recognized someone!"),
              content: Text(student.join(' ')),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Nice"))
              ],
            ));
  }

  void showSnackBar(Widget widget) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: widget));
  }

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
      showSnackBar(const Text("Heyo, we got no faces!"));
      return;
    }

    final faceImages = await _mlService.getFaceImages(faces, photoFile);

    List<Student> classStudents = widget.mClass.getStudents();
    List<Student> recognizedStudents = [];
    for (imglib.Image image in faceImages) {
      List predictedArray = await _mlService.predict(image);
      print("Predicted Arrays: ${predictedArray.cast().toString()}");
      final student = classStudents.cast().firstWhere((e) {
        final Student s = e;
        if (s.faceArray == null) return false;

        int minDistance = 999;
        double threshold = 1.5;
        var distance =
            _mlService.euclideanDistance(predictedArray, s.faceArray!);

        if (distance <= threshold && distance < minDistance) {
          print("Student Face Arrays: ${s.faceArray!.cast().toString()}");
          return true;
        } else {
          return false;
        }
      }, orElse: () => null);

      if (student != null) recognizedStudents.add(student);
    }

    showSuccessDialog(recognizedStudents);
  }

  @override
  Widget build(BuildContext context) => TakeAttendanceView(this);
}
