import 'package:a_check/models/school.dart';
import 'package:a_check/widgets/ip_camera_view.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
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
    return FutureBuilder(
        future: state.waitForSetup,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: buildAppBar(),
            body: state.isUsingIPCamera ? buildIPCamView() : buildCamera(),
          );
        });
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black.withOpacity(0.5),
      actions: [
        if (widget.schoolClass != null)
          IconButton(
            constraints: const BoxConstraints.expand(width: 150),
            onPressed: state.manualAttendance,
            icon: const Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              children: [
                Text(
                  "MANUAL\nATTENDANCE",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward),
              ],
            ),
          )
      ],
    );
  }

  CameraAwesomeBuilder buildCamera() {
    return CameraAwesomeBuilder.awesome(
      sensorConfig: SensorConfig.single(),
      saveConfig: SaveConfig.photo(
        pathBuilder: state.photoPathBuilder,
      ),
      topActionsBuilder: (camState) =>
          AwesomeTopActions(state: camState, children: [
        AwesomeFlashButton(state: camState),
      ]),
      middleContentBuilder: (state) => Container(),
      bottomActionsBuilder: (camState) => AwesomeBottomActions(
        state: camState,
        captureButton: AwesomeOrientedWidget(
            child: AwesomeBouncingWidget(
          onTap: () => state.takePhoto(camState),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.face_outlined,
                color: Colors.black,
              ),
            ),
          ),
        )),
        right: AwesomeOrientedWidget(
            child: AwesomeBouncingWidget(
          onTap: state.switchToIPCamera,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.15),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Icons.linked_camera,
              color: Colors.white,
            ),
          ),
        )),
      ),
    );
  }

  Widget buildIPCamView() {
    return FutureBuilder(
      future: state.connectToCamera(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
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
