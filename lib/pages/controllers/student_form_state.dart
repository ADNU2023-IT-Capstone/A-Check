import 'package:a_check/models/student.dart';
import 'package:a_check/pages/student_form_page.dart';
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
      guardian: guardian,
      faceArray: widget.student != null ? widget.student!.faceArray : null
    );

    HiveBoxes.studentsBox().put(student.id, student).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${widget.student == null ? "Added" : "Edited"} $student! (${student.id})")));
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to add $student!\n${error.toString()}")));
    });
  }

  @override
  void initState() {
    List<String?> values = [];
    if (widget.student != null) {
      final student = widget.student!;
      values.add(student.id.toString());
      values.add(student.firstName);
      values.add(student.middleName);
      values.add(student.lastName);
      values.add(student.phone);
      values.add(student.email);

      if (student.guardian == null) {
        values.addAll([null, null, null, null, null]);
      } else {
        values.add(student.guardian!.firstName);
        values.add(student.guardian!.middleName);
        values.add(student.guardian!.lastName);
        values.add(student.guardian!.phone);
        values.add(student.guardian!.email);
      }
    } else {
      values.addAll(
          [null, null, null, null, null, null, null, null, null, null, null]);
    }

    idCon = TextEditingController(text: values.elementAt(0));
    studentFNameCon = TextEditingController(text: values.elementAt(1));
    studentMNameCon = TextEditingController(text: values.elementAt(2));
    studentLNameCon = TextEditingController(text: values.elementAt(3));
    studentPhoneCon = TextEditingController(text: values.elementAt(4));
    studentEmailCon = TextEditingController(text: values.elementAt(5));
    guardianFNameCon = TextEditingController(text: values.elementAt(6));
    guardianMNameCon = TextEditingController(text: values.elementAt(7));
    guardianLNameCon = TextEditingController(text: values.elementAt(8));
    guardianPhoneCon = TextEditingController(text: values.elementAt(9));
    guardianEmailCon = TextEditingController(text: values.elementAt(10));

    super.initState();
  }

  @override
  Widget build(BuildContext context) => StudentFormView(this);
}
