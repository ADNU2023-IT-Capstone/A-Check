import 'package:a_check/models/class.dart';
import 'package:a_check/pages/controllers/take_attendance_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/camera_view.dart';
import 'package:a_check/widgets/ip_camera_view.dart';
import 'package:flutter/material.dart';

class TakeAttendancePage extends StatefulWidget {
  const TakeAttendancePage({Key? key, required this.mClass}) : super(key: key);

  final Class mClass;

  @override
  State<TakeAttendancePage> createState() => TakeAttendanceState();
}

class TakeAttendanceView
    extends WidgetView<TakeAttendancePage, TakeAttendanceState> {
  const TakeAttendanceView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: state.onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Take Attendance"),
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
      ),
    );
  }
}
