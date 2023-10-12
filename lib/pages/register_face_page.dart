import 'package:a_check/models/student.dart';
import 'package:a_check/pages/controllers/register_face_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/camera_view.dart';
import 'package:a_check/widgets/ip_camera_view.dart';
import 'package:flutter/material.dart';

class RegisterFacePage extends StatefulWidget {
  const RegisterFacePage({Key? key, required this.student}) : super(key: key);

  final Student student;

  @override
  State<RegisterFacePage> createState() => RegisterFaceState();
}

class RegisterFaceView extends WidgetView<RegisterFacePage, RegisterFaceState> {
  const RegisterFaceView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Face"),
      ),
      body: SafeArea(
          child: state.isUsingIPCamera
              ? IPCameraWidget(onScreenshot: state.processScreenshot)
              : CameraViewWidget(
                  onCapture: state.processCapturedImage,
                )),
      floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: state.switchCamera,
          child: const Icon(Icons.switch_video)),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
