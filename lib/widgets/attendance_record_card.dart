import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/pages/class/attendance_records_page.dart';
import 'package:a_check/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceRecordCard extends StatelessWidget {
  AttendanceRecordCard(
      {Key? key, required this.dateTime, required this.attendanceRecords})
      : super(key: key);

  final DateTime dateTime;
  final List<AttendanceRecord> attendanceRecords;

  final textColor = Themes.main.colorScheme.onPrimaryContainer;

  @override
  Widget build(BuildContext context) {
    int getPresents() {
      return attendanceRecords
          .where((element) => element.status == AttendanceStatus.Present)
          .length;
    }

    int getAbsenses() {
      return attendanceRecords
          .where((element) => element.status == AttendanceStatus.Absent)
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
        color: Themes.main.colorScheme.primaryContainer,
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
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                  Text(
                    DateFormat(DateFormat.ABBR_WEEKDAY).format(dateTime),
                    style: TextStyle(color: textColor),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("P: ${getPresents()}",
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.w300)),
                  Text("A: ${getAbsenses()}",
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.w300)),
                  Text("Total: ${attendanceRecords.length}",
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.w400))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
