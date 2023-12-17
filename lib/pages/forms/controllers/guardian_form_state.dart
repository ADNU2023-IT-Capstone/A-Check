import 'package:a_check/globals.dart';
import 'package:a_check/models/person.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/pages/forms/guardian_form_page.dart';
import 'package:flutter/material.dart';

class GuardianFormState extends State<GuardianFormPage> {
  late TextEditingController firstNameCon,
      middleNameCon,
      lastNameCon,
      phoneNumCon,
      emailCon;
  bool hasGuardian = false;
  final formKey = GlobalKey<FormState>();

  void setGuardian() {
    if (!formKey.currentState!.validate()) return;

    final guardian = Person(
        firstName: firstNameCon.text,
        middleName: middleNameCon.text,
        lastName: lastNameCon.text,
        phoneNumber: phoneNumCon.text,
        email: emailCon.text);
    final student = Student(
        id: widget.student.id,
        firstName: widget.student.firstName,
        middleName: widget.student.middleName,
        lastName: widget.student.lastName,
        phoneNumber: widget.student.phoneNumber,
        email: widget.student.email,
        guardian: guardian,
        faceArray: widget.student.faceArray,
        photoPath: widget.student.photoPath);

    studentsRef.doc(student.id).set(student).then((_) {
      snackbarKey.currentState!.showSnackBar(SnackBar(
          content: Text("Successfully set ${student.fullName}'s guardian!")));
      Navigator.pop(context);
    });
  }

  void onHasGuardianChanged(bool? value) {
    if (value != null) setState(() => hasGuardian = value);
  }

  @override
  void initState() {
    super.initState();

    firstNameCon = TextEditingController();
    middleNameCon = TextEditingController();
    lastNameCon = TextEditingController();
    phoneNumCon = TextEditingController();
    emailCon = TextEditingController();

    firstNameCon.text = widget.student.guardian?.firstName ?? "";
    middleNameCon.text = widget.student.guardian?.middleName ?? "";
    lastNameCon.text = widget.student.guardian?.lastName ?? "";
    phoneNumCon.text = widget.student.guardian?.phoneNumber ?? "";
    emailCon.text = widget.student.guardian?.email ?? "";
  }

  @override
  Widget build(BuildContext context) => GuardianFormView(this);
}
