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
    final faces = await _getFaces(inputImage);
    if (faces.isEmpty) {
      showSnackBar(const Text("Heyo, we got no faces!"));
      return;
    }

    final faceImages = await _getFaceImages(faces, photoFile);

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

  Future<List<Face>> _getFaces(InputImage inputImage) async {
    final FaceDetector faceDetector = FaceDetector(
        options:
            FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate));

    return await faceDetector.processImage(inputImage);
  }

  Future<List<imglib.Image>> _getFaceImages(
      List<Face> faces, File imageFile) async {
    if (faces.isEmpty) return List.empty();

    List<Map<String, int>> faceMaps = [];
    for (Face face in faces) {
      int x = face.boundingBox.left.toInt() - 10;
      int y = face.boundingBox.top.toInt() - 10;
      int w = face.boundingBox.width.toInt() + 10;
      int h = face.boundingBox.height.toInt() + 10;

      Map<String, int> thisMap = {'x': x, 'y': y, 'w': w, 'h': h};
      faceMaps.add(thisMap);
    }

    List<imglib.Image> faceImages = [];
    final bytes = await imageFile.readAsBytes();
    final decodedImage = imglib.decodeImage(bytes);
    for (Map<String, int> faceMap in faceMaps) {
      final faceCropImage = imglib.copyCrop(decodedImage!,
          x: faceMap['x']!,
          y: faceMap['y']!,
          width: faceMap['w']!,
          height: faceMap['h']!);

      faceImages.add(faceCropImage);
    }

    return faceImages;
  }

  @override
  Widget build(BuildContext context) => TakeAttendanceView(this);
}
