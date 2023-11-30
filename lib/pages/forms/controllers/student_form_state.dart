import 'package:a_check/pages/forms/student_form_page.dart';
import 'package:flutter/material.dart';

class StudentFormState extends State<StudentFormPage> {
  late TextEditingController idCon,
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

    // TODO: rework form finalization to work with firebase
    // final guardian = Person(
    //     firstName: guardianFNameCon!.text,
    //     middleName: guardianMNameCon!.text,
    //     lastName: guardianLNameCon!.text,
    //     phone: guardianPhoneCon!.text,
    //     email: guardianEmailCon!.text);
    // final student = Student(
    //     id: idCon!.text,
    //     firstName: studentFNameCon!.text,
    //     middleName: studentMNameCon!.text,
    //     lastName: studentLNameCon!.text,
    //     phone: studentPhoneCon!.text,
    //     email: studentEmailCon!.text,
    //     guardian: hasGuardian ? guardian : null,
    //     faceArray: widget.student != null ? widget.student!.faceArray : null,
    //     facePhotoBytes: widget.student != null ? widget.student!.facePhotoBytes : null);

    // HiveBoxes.studentsBox().put(student.id, student).then((value) {
    //   if (widget.currentClass != null) widget.currentClass!.addStudents([student.id]);
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text(
    //           "${widget.student == null ? "Added" : "Edited"} $student! (${student.id})")));
    //   Navigator.pop(context);
    // }).onError((error, stackTrace) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text("Failed to add $student!\n${error.toString()}")));
    // });
  }

  void onHasGuardianChanged(bool? value) {
    if (value != null) setState(() => hasGuardian = value);
  }

  @override
  void initState() {
    super.initState();

    idCon = TextEditingController();
    studentFNameCon = TextEditingController();
    studentMNameCon = TextEditingController();
    studentLNameCon = TextEditingController();
    studentPhoneCon = TextEditingController();
    studentEmailCon = TextEditingController();
    guardianFNameCon = TextEditingController();
    guardianMNameCon = TextEditingController();
    guardianLNameCon = TextEditingController();
    guardianPhoneCon = TextEditingController();
    guardianEmailCon = TextEditingController();

    if (widget.student != null) {
      studentFNameCon.text = widget.student!.firstName;
      studentMNameCon.text = widget.student!.middleName;
      studentLNameCon.text = widget.student!.lastName;
      studentPhoneCon.text = widget.student!.phoneNumber ?? "";
      studentEmailCon.text = widget.student!.email ?? "";
    }
  }

  @override
  Widget build(BuildContext context) => StudentFormView(this);
}
