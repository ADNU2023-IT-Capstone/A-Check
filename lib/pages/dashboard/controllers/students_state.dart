import 'package:a_check/pages/forms/student_form_page.dart';
import 'package:a_check/pages/dashboard/students_page.dart';
import 'package:flutter/material.dart';

class StudentsState extends State<StudentsPage> {
  void addStudent() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const StudentFormPage()));
  }

  void openIPCam() {
    
  }

  void openPhoneCam() {

  }

  @override
  Widget build(BuildContext context) => StudentsView(this);
}
