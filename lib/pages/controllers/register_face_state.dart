import 'dart:io';

import 'package:a_check/globals.dart';
import 'package:a_check/pages/register_face_page.dart';
import 'package:a_check/utils/mlservice.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as imglib;
import 'package:path_provider/path_provider.dart';

class RegisterFaceState extends State<RegisterFacePage> {
  final _mlService = MLService();
  bool isUsingIPCamera = false;

  void showSnackBar(Widget widget) {
    snackbarKey.currentState!.showSnackBar(SnackBar(content: widget));
  }

  void switchCamera() {
    setState(() => isUsingIPCamera = !isUsingIPCamera);
  }

  void processScreenshot(Uint8List screenshot) async {
    showSnackBar(const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Capturing screenshot..."), CircularProgressIndicator()],
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
      snackbarKey.currentState!.hideCurrentSnackBar();
      showSnackBar(const Text("Heyo, we got no faces!"));
      return;
    }

    final faceImage = (await _mlService.getFaceImages([faces.first], photoFile)).first;
    final encodedImage = imglib.encodeJpg(faceImage);
    if (context.mounted) {
      final result = await Dialogs.showConfirmDialog(
          context, const Text("Register face"), Image.memory(encodedImage));
      if (result != null && result) {
        widget.student.faceArray = await _mlService.predict(faceImage);
        widget.student.facePhotoBytes = encodedImage;
        widget.student.save().catchError((e) {
          if (context.mounted) {
            snackbarKey.currentState!.hideCurrentSnackBar();
            Navigator.pop(context, {'result': false, 'error': e});
          }
        });

        if (context.mounted) {
          snackbarKey.currentState!.hideCurrentSnackBar();
          Navigator.pop(context, true);
        }
      } else {
        if (context.mounted) snackbarKey.currentState!.hideCurrentSnackBar();
      }
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
  Widget build(BuildContext context) => RegisterFaceView(this);

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
