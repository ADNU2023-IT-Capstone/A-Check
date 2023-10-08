import 'package:a_check/models/student.dart';
import 'package:a_check/pages/controllers/student_form_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/validators.dart';

class StudentFormPage extends StatefulWidget {
  const StudentFormPage({Key? key, this.student}) : super(key: key);

  final Student? student;

  @override
  State<StudentFormPage> createState() => StudentFormState();
}

class StudentFormView extends WidgetView<StudentFormPage, StudentFormState> {
  const StudentFormView(state, {Key? key}) : super(state, key: key);

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: Colors.black26, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: Color(0xff000000), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: Color(0xff000000), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Colors.red.shade400, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Colors.red.shade400, width: 2),
      ),
      labelText: labelText,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        color: Color(0xff000000),
      ),
      counterText: "",
      filled: true,
      fillColor: const Color(0xfff2f2f3),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    );
  }

  Widget buildStudentForms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            "Student Information",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.hasValue,
            controller: state.idCon,
            enabled: widget.student == null,
            obscureText: false,
            textAlign: TextAlign.start,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("Student ID"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.hasValue,
            controller: state.studentFNameCon,
            obscureText: false,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("First Name"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.hasValue,
            controller: state.studentMNameCon,
            obscureText: false,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("Middle Name"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.hasValue,
            controller: state.studentLNameCon,
            obscureText: false,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("Last Name"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.isAMobileNumber,
            controller: state.studentPhoneCon,
            obscureText: false,
            textAlign: TextAlign.start,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            maxLength: 11,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("Mobile Number"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.isAnEmail,
            controller: state.studentEmailCon,
            obscureText: false,
            textAlign: TextAlign.start,
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("E-mail"),
          ),
        ),
      ],
    );
  }

  Widget buildGuardianForms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 24, bottom: 8),
          child: Text(
            "Guardian Information",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.hasValue,
            controller: state.guardianFNameCon,
            obscureText: false,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("First Name"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.hasValue,
            controller: state.guardianMNameCon,
            obscureText: false,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("Middle Name"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.hasValue,
            controller: state.guardianLNameCon,
            obscureText: false,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("Last Name"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.isAMobileNumber,
            controller: state.guardianPhoneCon,
            obscureText: false,
            textAlign: TextAlign.start,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            maxLength: 11,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("Contact Number"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: Validators.isAnEmail,
            controller: state.guardianEmailCon,
            obscureText: false,
            textAlign: TextAlign.start,
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: inputDecoration("E-mail"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.student == null ? "Create a student" : "Editing student"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: MediaQuery.of(context).viewInsets.bottom),
        physics: const ClampingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height),
          child: Form(
              key: state.formKey,
              child: Column(
                children: [
                  buildStudentForms(),
                  buildGuardianForms(),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: MaterialButton(
                      onPressed: state.addStudent,
                      color: const Color(0xff000000),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                            color: Color(0xff808080), width: 1),
                      ),
                      padding: const EdgeInsets.all(16),
                      textColor: const Color(0xffffffff),
                      height: 40,
                      minWidth: 140,
                      child: Text(
                        widget.student == null ? "Add Student" : "Confirm",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
