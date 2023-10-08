import 'package:a_check/models/class.dart';
import 'package:a_check/pages/class_page.dart';
import 'package:a_check/pages/student_form_page.dart';
import 'package:a_check/pages/students_form_page.dart';
import 'package:a_check/pages/take_attendance_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:flutter/material.dart';

class ClassState extends State<ClassPage> {
  late Class mClass;

  void backButtonPressed() {
    Navigator.pop(context);
  }

  void takeAttendance() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TakeAttendancePage(mClass: mClass)));
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
      mClass.students.addAll(result);
      mClass.save();
    });
  }

  @override
  void initState() {
    super.initState();

    mClass = HiveBoxes.classesBox().get(widget.classKey);
  }

  @override
  Widget build(BuildContext context) => ClassView(this);
}
