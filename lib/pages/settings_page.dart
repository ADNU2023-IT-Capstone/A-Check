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
                Card(
                  child: ListTile(
                    title: const Text("Set Absent Limit"),
                    onTap: state.setAbsentLimit,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
