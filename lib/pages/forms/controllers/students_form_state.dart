import 'package:a_check/models/student.dart';
import 'package:a_check/pages/forms/students_form_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:flutter/material.dart';

class StudentsFormState extends State<StudentsFormPage> {
  final Map<String, bool> students = {};

  void checkBoxOnChanged(String key, bool? value) {
    setState(() => students[key] = value!);
  }

  void addSelectedStudents() {
    List<String> selectedStudents = [];

    students.forEach((key, value) {
      if (value == true) selectedStudents.add(key);
    });

    Navigator.pop(context, selectedStudents);
  }

  @override
  void initState() {
    super.initState();

    final castedBox = HiveBoxes.studentsBox().values.cast();
    for (Student student in castedBox) { 
      students.addAll({student.id: false});
    }
  }

  @override
  Widget build(BuildContext context) => StudentsFormView(this);
}