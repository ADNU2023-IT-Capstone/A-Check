import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/models/student.dart';
import 'package:a_check/pages/class_page.dart';
import 'package:a_check/pages/student_form_page.dart';
import 'package:a_check/pages/students_form_page.dart';
import 'package:a_check/pages/take_attendance_page.dart';
import 'package:flutter/material.dart';

class ClassState extends State<ClassPage> {
  late List<Student> students;
  late Map<DateTime, List<AttendanceRecord>> attendanceRecords;

  void backButtonPressed() {
    Navigator.pop(context);
  }

  void takeAttendance() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TakeAttendancePage(mClass: widget.mClass)));

    setState(() {
      attendanceRecords = widget.mClass.getAttendanceRecords();
    });
  }

  void addNewStudent() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const StudentFormPage()));

    setState(() {});
  }

  void addExistingStudent() async {
    final List<String>? result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const StudentsFormPage()));

    if (result == null || result.isEmpty) return;

    setState(() {
      widget.mClass.students.addAll(result);
      widget.mClass.save();

      students = widget.mClass.getStudents();
    });
  }

  @override
  void initState() {
    super.initState();

    students = widget.mClass.getStudents();
    attendanceRecords = widget.mClass.getAttendanceRecords();
  }

  @override
  Widget build(BuildContext context) => ClassView(this);
}
