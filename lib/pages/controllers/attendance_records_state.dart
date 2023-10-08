import 'package:a_check/globals.dart';
import 'package:a_check/pages/attendance_records_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:flutter/material.dart';

class AttendanceRecordsState extends State<AttendanceRecordsPage> {
  Future<bool> showConfirmDialog(Widget title, Widget content) async {
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

  void deleteRecord() async {
    if (await showConfirmDialog(const Text("Delete Record"), const Text("This action will delete this record. Continue?"))) {
      final keys = widget.records.map((e) => e.key);
      HiveBoxes.attendancesBox().deleteAll(keys);

      if (context.mounted) {
        snackbarKey.currentState!.showSnackBar(const SnackBar(content: Text("Deleted the record.")));
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) => AttendanceRecordsView(this);
}
