import 'package:a_check/pages/student_form_page.dart';
import 'package:a_check/pages/students_page.dart';
import 'package:flutter/material.dart';

class StudentsState extends State<StudentsPage> {
  void addStudent() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const StudentFormPage()));
  }

  @override
  Widget build(BuildContext context) => StudentsView(this);
}
