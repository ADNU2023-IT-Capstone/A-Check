import 'package:a_check/models/person.dart';
import 'package:a_check/pages/forms/students_form_page.dart';
import 'package:flutter/material.dart';

class StudentsFormState extends State<StudentsFormPage> {
  final Map<String, bool> studentsMap = {};

  void checkBoxOnChanged(String key, bool? value) {
    setState(() => studentsMap[key] = value!);
  }

  void addSelectedStudents() {
    List<String> selectedStudents = [];

    studentsMap.forEach((key, value) {
      if (value == true) selectedStudents.add(key);
    });

    Navigator.pop(context, selectedStudents);
  }

  @override
  void initState() {
    super.initState();

    studentsRef.get().then((value) {
      final students = value.docs.map((e) => e.data).toList();

      for (Student student in students) {
        studentsMap.addAll({student.id: false});
      }
    });
  }

  @override
  Widget build(BuildContext context) => StudentsFormView(this);
}
