import 'package:a_check/models/class.dart';
import 'package:a_check/models/student.dart';
import 'package:a_check/pages/controllers/face_recognition_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/camera_view.dart';
import 'package:a_check/widgets/ip_camera_view.dart';
import 'package:flutter/material.dart';

class FaceRecognitionPage extends StatefulWidget {
  const FaceRecognitionPage({super.key, this.student, this.mClass});

  final Student? student;
  final Class? mClass;

  @override
  State<FaceRecognitionPage> createState() => FaceRecognitionState();
}

class FaceRecognitionView extends WidgetView<FaceRecognitionPage, FaceRecognitionState> {
  const FaceRecognitionView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: state.onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.student != null ? "Register face" : "Take attendance"),
        ),
        body: SafeArea(
            child: state.isUsingIPCamera
                ? IPCameraWidget(onScreenshot: state.captureScreenshot)
                : CameraViewWidget(
                    onCapture: state.capturePhoto,
                  )
                  ),
        floatingActionButton: FloatingActionButton(
            heroTag: null,
            onPressed: state.switchCamera,
            child: const Icon(Icons.switch_video)),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      ),
    );
  }
}