import 'package:a_check/models/attendance_record.dart';
import 'package:flutter/material.dart';

class AttendanceRecordCard extends StatelessWidget {
  const AttendanceRecordCard({Key? key, required this.dateTime, required this.attendanceRecords}) : super(key: key);

  final DateTime dateTime;
  final List<AttendanceRecord> attendanceRecords;

  

  @override
  Widget build(BuildContext context) {
    void onTap() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There are ${attendanceRecords.length} records.")));
    }

    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(dateTime.toLocal().toString()),
        ),
      ),
    );
  }
}
