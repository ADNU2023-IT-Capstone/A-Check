import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/widgets/student_attendance_record_card.dart';
import 'package:flutter/material.dart';

class SARCState extends State<StudentAttendanceRecordCard> {
  AttendanceStatus? status;

  void onRadioChanged(AttendanceStatus? value) async {
    setState(() {
      status = value;
    });

    if (value != null) widget.record.status = value;
    await widget.record.save();
  }

  @override
  void initState() {
    super.initState();

    status = widget.record.status;
  }

  @override
  Widget build(BuildContext context) => SARCView(this);
}
