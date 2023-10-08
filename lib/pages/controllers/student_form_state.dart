import 'package:a_check/models/student.dart';
import 'package:a_check/pages/student_form_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:flutter/material.dart';

class StudentFormState extends State<StudentFormPage> {
  late TextEditingController fNameCon, mNameCon, lNameCon, idCon;
  final formKey = GlobalKey<FormState>();

  void addStudent() {
    final student = Student(
        firstName: fNameCon.text,
        middleName: mNameCon.text,
        lastName: lNameCon.text,
        id: idCon.text);

    HiveBoxes.studentsBox().put(student.id, student).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Added $student! (${student.id})")));
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to add $student!\n${error.toString()}")));
    });
  }

  @override
  void initState() {
    super.initState();

    fNameCon = TextEditingController();
    mNameCon = TextEditingController();
    lNameCon = TextEditingController();
    idCon = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => StudentFormView(this);
}
