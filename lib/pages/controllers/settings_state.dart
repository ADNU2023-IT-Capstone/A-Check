import 'package:a_check/models/class.dart';
import 'package:a_check/pages/settings_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:flutter/material.dart';

class SettingsState extends State<SettingsPage> {
  void clearAllClasses() {
    Widget createDialog() {
      return AlertDialog(
        title: const Text("Clear All Classes"),
        content: const Text(
            "Are you sure you want to delete ALL classes? This is not recoverable!"),
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

    showDialog(context: context, builder: (context) => createDialog())
        .then((value) {
      if (value == true) {
        HiveBoxes.classesBox().clear().then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cleared all classes.")));
        });
      }
    });
  }

  void clearAllStudents() {
    Widget createDialog() {
      return AlertDialog(
        title: const Text("Clear All Students"),
        content: const Text(
            "Are you sure you want to delete ALL students? This is not recoverable!"),
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

    showDialog(context: context, builder: (context) => createDialog())
        .then((value) {
      if (value == true) {
        HiveBoxes.studentsBox().clear().then((value) {
          HiveBoxes.classesBox().values.forEach((element) {
            final c = element as Class;
            c.students.clear();
          });
          
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cleared all students.")));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => SettingsView(this);
}