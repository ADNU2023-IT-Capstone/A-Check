import 'package:a_check/models/school.dart';
import 'package:a_check/pages/auto_attendance/ip_camera_view.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/camera_view.dart';
import 'package:flutter/material.dart';

import 'controllers/face_recognition_state.dart';

class FaceRecognitionPage extends StatefulWidget {
  const FaceRecognitionPage({super.key, this.student, this.schoolClass});

  final Student? student;
  final SchoolClass? schoolClass;

  @override
  State<FaceRecognitionPage> createState() => FaceRecognitionState();
}

class FaceRecognitionView
    extends WidgetView<FaceRecognitionPage, FaceRecognitionState> {
  const FaceRecognitionView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: state.onWillPop,
        child: FutureBuilder(
          future: state.waitForSetup,
          builder: (context, snapshot) => Scaffold(
            appBar: AppBar(
              title: Text(
                  widget.student != null ? "Register face" : "Take attendance"),
            ),
            body: SafeArea(
                child: state.isUsingIPCamera
                    ? buildIPCamView()
                    : CameraViewWidget(
                        onCapture: state.capturePhoto,
                      )),
            floatingActionButton: FloatingActionButton(
                heroTag: null,
                onPressed: state.switchCamera,
                child: const Icon(Icons.switch_video)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndTop,
          ),
        ));
  }

  Widget buildIPCamView() {
    return FutureBuilder(
      future: state.connectToCamera(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const AspectRatio(
            aspectRatio: 16 / 9,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 8),
                Text("Connecting to IP camera...")
              ],
            ),
          );
        }

        return IPCameraView(
          url: snapshot.data!,
          onCapture: state.captureScreenshot,
        );
      },
    );
  }
}
