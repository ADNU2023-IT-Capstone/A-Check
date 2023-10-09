import 'package:a_check/models/class.dart';
import 'package:a_check/widgets/schedule_dialog.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> showAlertDialog(
      BuildContext context, Widget title, Widget content) async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: title,
              content: content,
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text("Ok")),
              ],
            ));
  }

  static Future<bool> showConfirmDialog(
      BuildContext context, Widget title, Widget content) async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
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
                    child: const Text("No")),
              ],
            ));
  }

  static Future<ClassSchedule?> showScheduleDialog(BuildContext context,
      {ClassSchedule? schedule}) async {
    return await showDialog(
      context: context,
      builder: (context) => ScheduleDialog(
        schedule: schedule,
      ),
    );
  }
}
