import 'package:a_check/pages/attendance_records_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:a_check/widgets/dialogs.dart';
import 'package:flutter/material.dart';

class AttendanceRecordsState extends State<AttendanceRecordsPage> {
  void deleteRecord() async {
    if (await Dialogs.showConfirmDialog(context, const Text("Delete Record"), const Text("This action will delete this record. Continue?"))) {
      final keys = widget.records.map((e) => e.key);
      HiveBoxes.attendancesBox().deleteAll(keys);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Deleted the record.")));
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) => AttendanceRecordsView(this);
}
