import 'package:a_check/models/school.dart';
import 'package:a_check/themes.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:flutter/material.dart';

import 'controllers/auto_attendance_state.dart';
import 'ip_camera_view.dart';

class AutoAttendancePage extends StatefulWidget {
  const AutoAttendancePage({super.key, required this.schoolClass});

  final SchoolClass schoolClass;

  @override
  State<StatefulWidget> createState() => AutoAttendanceState();
}

class AutoAttendanceView
    extends WidgetView<AutoAttendancePage, AutoAttendanceState> {
  const AutoAttendanceView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: state.waitForSetup,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [buildIPCamPlayer(), buildRecognizedList()],
            ),
            floatingActionButton: buildFab(),
          );
        });
  }

  Widget buildIPCamPlayer() {
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

        if (!state.isTakingScreenshots) {
          return const AspectRatio(
            aspectRatio: 16 / 9,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("You are currently not capturing!")],
            ),
          );
        }

        return IPCameraView(
          url: snapshot.data!,
          onFrame: state.onFrame,
        );
      },
    );
  }

  Widget buildRecognizedList() {
    return Expanded(
      child: ListView.builder(
        itemCount: state.recognizedStudents.entries.length,
        itemBuilder: (context, index) {
          final item = state.recognizedStudents.entries.elementAt(index).value;

          return Card(
            color: item.locked ? Colors.amber[100] : null,
            child: ListTile(
                title: Text(item.student.fullName),
                subtitle: Text(item.distance.toStringAsFixed(2)),
                leading: Image.memory(item.jpegBytes),
                trailing: Text(item.occurences.toString()),
                onTap: () => state.correction(item)),
          );
        },
      ),
    );
  }

  Widget buildFab() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton.extended(
          heroTag: null,
          tooltip: "Toggle camera",
          onPressed: state.toggleCapture,
          backgroundColor: state.isTakingScreenshots
              ? Themes.main.colorScheme.primary
              : null,
          label: const Text("Toggle IP camera"),
          icon: state.isTakingScreenshots
              ? const Icon(Icons.video_camera_front)
              : const Icon(Icons.video_camera_front_outlined),
        ),
        const SizedBox(height: 8),
        FloatingActionButton.extended(
          heroTag: null,
          label: const Text("Finalize attendance"),
          icon: const Icon(Icons.event_note),
          tooltip: "Record",
          onPressed: state.finalize,
        ),
      ],
    );
  }
}
