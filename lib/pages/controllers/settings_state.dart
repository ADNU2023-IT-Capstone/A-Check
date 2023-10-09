import 'package:a_check/models/class.dart';
import 'package:a_check/pages/settings_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:flutter/material.dart';

class SettingsState extends State<SettingsPage> {
  Widget _createConfirmDialog(Widget title, Widget content) {
    return AlertDialog(
      title: title,
      content: content,
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text("Yes")),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text("Cancel"))
      ],
    );
  }

  void clearAllClasses() {
    showDialog(
            context: context,
            builder: (context) => _createConfirmDialog(
                const Text("Clear All Classes"),
                const Text(
                    "Are you sure you want to delete ALL CLASSES? This is not recoverable!")))
        .then((value) {
      if (value == true) {
        HiveBoxes.classesBox().clear().then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cleared all classes.")));
        });
      }
    });
  }

  void clearAllAttendanceRecords() {
    showDialog(
            context: context,
            builder: (context) => _createConfirmDialog(
                const Text("Clear All Students"),
                const Text(
                    "Are you sure you want to delete ALL ATTENDANCE RECORDS? This is not recoverable!")))
        .then((value) {
      if (value == true) {
        HiveBoxes.attendancesBox().clear().then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cleared all attendance records.")));
        });
      }
    });
  }

  void clearAllStudents() {
    showDialog(
            context: context,
            builder: (context) => _createConfirmDialog(
                const Text("Clear All Students"),
                const Text(
                    "Are you sure you want to delete ALL STUDENTS? This is not recoverable!")))
        .then((value) {
      if (value == true) {
        HiveBoxes.studentsBox().clear().then((value) {
          HiveBoxes.classesBox().values.forEach((element) {
            final c = element as Class;
            c.studentIds.clear();
            c.save();
          });

          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cleared all students.")));
        });
      }
    });
  }

  void setAbsentLimit() {
    
  }

  @override
  Widget build(BuildContext context) => SettingsView(this);
}
