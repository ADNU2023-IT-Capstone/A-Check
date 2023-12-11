import 'package:a_check/globals.dart';
import 'package:a_check/pages/class/attendance_records_page.dart';
import 'package:a_check/utils/csv_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceRecordsState extends State<AttendanceRecordsPage> {
  @override
  Widget build(BuildContext context) => AttendanceRecordsView(this);

  void exportRecord() async {
    final header = [
      "ID",
      "Last Name",
      "First Name",
      "Middle Name",
      "Time",
      "Status"
    ];
    final data = <dynamic>[];

    for (var record in widget.records) {
      final student = await record.getStudent();
      data.add([
        record.studentId,
        student.lastName,
        student.firstName,
        student.middleName,
        DateFormat(DateFormat.HOUR_MINUTE).format(record.dateTime),
        record.status.toString()
      ]);
    }

    await CsvHelpers.exportToCsvFile(
            fileName:
                "${widget.records.first.classId}-${DateFormat(DateFormat.YEAR_NUM_MONTH_DAY).format(widget.records.first.dateTime)}",
            header: header,
            data: data)
        .then((filePath) {
      snackbarKey.currentState!.showSnackBar(SnackBar(
        content: Text("Successfully exported record as CSV file to $filePath!"),
        duration: const Duration(seconds: 10),
      ));
    });
  }
}
