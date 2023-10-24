import 'dart:typed_data';

import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/controllers/ip_camera_view_state.dart';
import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';

class IPCameraWidget extends StatefulWidget {
  const IPCameraWidget({super.key, this.onScreenshot, this.onFrame});

  final Function(Uint8List screenshot)? onScreenshot;
  final Function(dynamic frame)? onFrame;

  @override
  State<IPCameraWidget> createState() => IPCameraState();
}

class IPCameraView extends WidgetView<IPCameraWidget, IPCameraState> {
  const IPCameraView(super.state, {super.key});

  Widget buildBody() {
    return FutureBuilder(
        future: state.initializePlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 9.0 / 16.0,
                child: Video(
                    controller: state.videoController,
                    controls: NoVideoControls),
              ),
            );
          } else {
            return const Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
                Text("Connecting to IP camera...")
              ]),
            );
          }
        });
  }

  Widget? buildFab() {
    return FutureBuilder(
        future: state.initializePlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: state.takingScreenshot ? null : state.takeScreenshot,
                  backgroundColor: state.takingScreenshot ? Colors.grey[600] : null,
                  disabledElevation: 0,
                  heroTag: null,
                  child: const Icon(Icons.camera),
                ),
              ],
            );
          } else {
            return Container();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      floatingActionButton: buildFab(),
    );
  }
}
