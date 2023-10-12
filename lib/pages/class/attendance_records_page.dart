import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/pages/class/controllers/attendance_records_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/student_attendance_record_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceRecordsPage extends StatefulWidget {
  const AttendanceRecordsPage({Key? key, required this.records})
      : super(key: key);

  final List<AttendanceRecord> records;

  @override
  State<AttendanceRecordsPage> createState() => AttendanceRecordsState();
}

class AttendanceRecordsView
    extends WidgetView<AttendanceRecordsPage, AttendanceRecordsState> {
  const AttendanceRecordsView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Attendance Record"),
              Text(
                DateFormat("MMMM d, y").format(widget.records.first.dateTime),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: state.deleteRecord,
                  child: const Text("Delete record"),
                )
              ],
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          children: widget.records
              .map((e) => StudentAttendanceRecordCard(record: e))
              .toList(),
        ));
  }
}
