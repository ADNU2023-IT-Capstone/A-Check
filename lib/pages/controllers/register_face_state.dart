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
    final faces = await _mlService.getFaces(inputImage);
    if (faces.isEmpty) {
      showSnackBar(const Text("Heyo, we got no faces!"));
      return;
    }

    final faceImages = await _mlService.getFaceImages(faces, photoFile);
    if (await showConfirmDialog(faceImages[0])) {
      widget.student.faceArray = await _mlService.predict(faceImages[0]);
      widget.student.save();
      popNavigator(true);
    } else {
      popNavigator(false);
    }
  }

  @override
  Widget build(BuildContext context) => RegisterFaceView(this);
}
