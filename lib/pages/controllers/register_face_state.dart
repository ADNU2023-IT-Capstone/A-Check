import 'dart:io';

import 'package:a_check/pages/register_face_page.dart';
import 'package:a_check/utils/mlservice.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as imglib;

class RegisterFaceState extends State<RegisterFacePage> {
  final _mlService = MLService();

  Future<bool> showConfirmDialog(imglib.Image faceImage) async {
    final bytes = imglib.encodeJpg(faceImage);

    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Register face"),
              content: Image.memory(bytes),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text("Yes")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text("No")),
              ],
            ));
  }

  void showSnackBar(Widget widget) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: widget));
  }

  void popNavigator(bool isSuccess) {
    Navigator.pop(context, isSuccess);
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
    if (await showConfirmDialog(faceImages[0])) {
      widget.student.faceArray = await _mlService.predict(faceImages[0]);
      widget.student.save();
      popNavigator(true);
    } else {
      popNavigator(false);
    }
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
  Widget build(BuildContext context) => RegisterFaceView(this);
}
