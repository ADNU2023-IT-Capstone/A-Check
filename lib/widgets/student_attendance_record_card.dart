import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/controllers/student_attendance_record_card_state.dart';
import 'package:flutter/material.dart';

class StudentAttendanceRecordCard extends StatefulWidget {
  const StudentAttendanceRecordCard({Key? key, required this.record})
      : super(key: key);

  final AttendanceRecord record;

  @override
  State<StudentAttendanceRecordCard> createState() => SARCState();
}

class SARCView extends WidgetView<StudentAttendanceRecordCard, SARCState> {
  const SARCView(state, {Key? key}) : super(state, key: key);

  Widget radioButton({required String title, required AttendanceStatus value}) {
    return Column(
      children: [
        Text(title),
        Radio<AttendanceStatus>(
            value: value,
            groupValue: state.status,
            onChanged: state.onRadioChanged)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.record.getStudent.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.record.getStudent.id),
              ],
            ),
            const SizedBox(width: 24,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                radioButton(title: "P", value: AttendanceStatus.present),
                radioButton(title: "A", value: AttendanceStatus.absent),
                radioButton(title: "L", value: AttendanceStatus.late),
                radioButton(title: "E", value: AttendanceStatus.excused),
              ],
            )
          ],
        ),
      ),
    );
  }
}
