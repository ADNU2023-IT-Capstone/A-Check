import 'package:a_check/pages/controllers/settings_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => SettingsState();
}

class SettingsView extends WidgetView<SettingsPage, SettingsState> {
  const SettingsView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                title: const Text("Connect to IP camera"),
                onTap: state.connectToIpCam,
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("Set absent warning value"),
                onTap: state.setAbsentWarning,
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("Set absent limit value"),
                onTap: state.setAbsentLimit,
              ),
            ),
            // TODO: sms notifs
            Card(
              child: ListTile(
                title: const Text("Automatic SMS notification"),
                subtitle: const Text(
                    "If enabled, will notify the student and its guardian when absent warning and limit value is met through SMS"),
                trailing: Checkbox(
                    onChanged: (value) {},
                    value: false,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
                onTap: state.toggleSMSNotifs,
              ),
            ),
            // TODO: email notifs
            Card(
              child: ListTile(
                title: const Text("Automatic email notification"),
                subtitle: const Text(
                    "If enabled, will notify the student and its guardian when absent warning and limit value is met through email"),
                trailing: Checkbox(
                    onChanged: (value) {},
                    value: false,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
                onTap: state.toggleEmailNotifs,
              ),
            ),
            Card(
              child: ListTile(
                title:
                    const Text("Set distance threshold (for face recognition)"),
                onTap: state.setDistanceThreshold,
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("Clear all classes"),
                onTap: state.clearAllClasses,
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("Clear all students"),
                onTap: state.clearAllStudents,
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("Clear all attendance records"),
                onTap: state.clearAllAttendanceRecords,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
