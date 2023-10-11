import 'dart:io';

import 'package:a_check/pages/register_face_page.dart';
import 'package:a_check/utils/mlservice.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as imglib;

class RegisterFaceState extends State<RegisterFacePage> {
  final _mlService = MLService();

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
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      showSnackBar(const Text("Heyo, we got no faces!"));
      return;
    }

    final faceImage = (await _mlService.getFaceImages(faces, photoFile)).first;
    final encodedImage = imglib.encodeJpg(faceImage);
    if (context.mounted) {
      if (await Dialogs.showConfirmDialog(
          context, const Text("Register face"), Image.memory(encodedImage))) {
        widget.student.faceArray = await _mlService.predict(faceImage);
        widget.student.save().catchError((e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.pop(context, {'result': false, 'error': e});
          }
        });

        if (context.mounted) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          Navigator.pop(context, true);
        }
      } else {
        if (context.mounted) ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }
    }
  }

  @override
  Widget build(BuildContext context) => RegisterFaceView(this);
}
