import 'package:a_check/models/student.dart';
import 'package:a_check/pages/forms/student_form_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:flutter/material.dart';

class StudentFormState extends State<StudentFormPage> {
  TextEditingController? idCon,
      studentFNameCon,
      studentMNameCon,
      studentLNameCon,
      studentPhoneCon,
      studentEmailCon,
      guardianFNameCon,
      guardianMNameCon,
      guardianLNameCon,
      guardianPhoneCon,
      guardianEmailCon;
  bool hasGuardian = false;
  final formKey = GlobalKey<FormState>();

  void addStudent() {
    if (!formKey.currentState!.validate()) return;

    final guardian = Person(
        firstName: guardianFNameCon!.text,
        middleName: guardianMNameCon!.text,
        lastName: guardianLNameCon!.text,
        phone: guardianPhoneCon!.text,
        email: guardianEmailCon!.text);
    final student = Student(
        id: idCon!.text,
        firstName: studentFNameCon!.text,
        middleName: studentMNameCon!.text,
        lastName: studentLNameCon!.text,
        phone: studentPhoneCon!.text,
        email: studentEmailCon!.text,
        guardian: hasGuardian ? guardian : null,
        faceArray: widget.student != null ? widget.student!.faceArray : null);

    HiveBoxes.studentsBox().put(student.id, student).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "${widget.student == null ? "Added" : "Edited"} $student! (${student.id})")));
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to add $student!\n${error.toString()}")));
    });
  }

  void onHasGuardianChanged(bool? value) {
    if (value != null) setState(() => hasGuardian = value);
  }

  @override
  void initState() {
    List<String?> values = [];
    if (widget.student != null) {
      final student = widget.student!;
      values.addAll([
        student.id.toString(),
        student.firstName,
        student.middleName,
        student.lastName,
        student.phone,
        student.email
      ]);

      if (student.guardian == null) {
        values.addAll([null, null, null, null, null]);
      } else {
        setState(() => hasGuardian = true);
        values.addAll([
          student.guardian!.firstName,
          student.guardian!.middleName,
          student.guardian!.lastName,
          student.guardian!.phone,
          student.guardian!.email
        ]);
      }
    } else {
      values.addAll(
          [null, null, null, null, null, null, null, null, null, null, null]);
    }

    idCon = TextEditingController(text: values[0]);
    studentFNameCon = TextEditingController(text: values[1]);
    studentMNameCon = TextEditingController(text: values[2]);
    studentLNameCon = TextEditingController(text: values[3]);
    studentPhoneCon = TextEditingController(text: values[4]);
    studentEmailCon = TextEditingController(text: values[5]);
    guardianFNameCon = TextEditingController(text: values[6]);
    guardianMNameCon = TextEditingController(text: values[7]);
    guardianLNameCon = TextEditingController(text: values[8]);
    guardianPhoneCon = TextEditingController(text: values[9]);
    guardianEmailCon = TextEditingController(text: values[10]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => StudentFormView(this);
}
