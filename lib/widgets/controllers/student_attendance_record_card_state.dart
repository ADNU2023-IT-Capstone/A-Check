import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/widgets/student_attendance_record_card.dart';
import 'package:flutter/material.dart';

class SARCState extends State<StudentAttendanceRecordCard> {
  AttendanceStatus? status;

  void onRadioChanged(AttendanceStatus? value) {
    final oldValue = status;

    setState(() {
      status = value;
    });

    if (value != null) widget.record.setStatus = value;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          "Changed the status of ${widget.record.getStudent.lastName} to ${status.toString()}"),
      action:
          SnackBarAction(label: "Undo", onPressed: () => _undoChange(oldValue)),
    ));
  }

  void _undoChange(AttendanceStatus? oldValue) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    setState(() {
      status = oldValue;
    });

    if (oldValue != null) widget.record.setStatus = oldValue;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          "Restored the status of ${widget.record.getStudent.lastName} to ${status.toString()}"),
    ));
  }

  @override
  void initState() {
    super.initState();

    status = widget.record.status;
  }

  @override
  Widget build(BuildContext context) => SARCView(this);
}
