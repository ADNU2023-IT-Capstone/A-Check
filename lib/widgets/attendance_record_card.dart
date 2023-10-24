import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/pages/class/attendance_records_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceRecordCard extends StatelessWidget {
  const AttendanceRecordCard(
      {Key? key, required this.dateTime, required this.attendanceRecords})
      : super(key: key);

  final DateTime dateTime;
  final List<AttendanceRecord> attendanceRecords;

  @override
  Widget build(BuildContext context) {
    int getPresents() {
      return attendanceRecords
          .where((element) => element.status == AttendanceStatus.present)
          .length;
    }

    int getAbsenses() {
      return attendanceRecords
          .where((element) => element.status == AttendanceStatus.absent)
          .length;
    }

    void onTap() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AttendanceRecordsPage(
              records: attendanceRecords,
            ),
          ));
    }

    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMd().format(dateTime),
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${DateFormat(DateFormat.ABBR_WEEKDAY).format(dateTime)}, ${DateFormat(DateFormat.HOUR_MINUTE).format(dateTime)}",
                    style: const TextStyle(),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("P: ${getPresents()}"),
                  Text("A: ${getAbsenses()}"),
                  Text("Total: ${attendanceRecords.length}")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
