import 'package:a_check/models/school_class.dart';
import 'package:a_check/models/person.dart';
import 'package:a_check/pages/forms/controllers/student_form_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/validators.dart';

class StudentFormPage extends StatefulWidget {
  const StudentFormPage({Key? key, this.student, this.currentClass}) : super(key: key);

  final Student? student;
  final SchoolClass? currentClass;

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
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: Color(0xff9e9e9e), width: 1),
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
      fillColor: const Color(0x00ffffff),
      isDense: false,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    );
  }

  Widget buildStudentForms() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            textInputAction: TextInputAction.next,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.black54,
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
            textInputAction: TextInputAction.next,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.black54,
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
            textInputAction: TextInputAction.next,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.black54,
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
            textInputAction: TextInputAction.next,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.black54,
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
            textInputAction: TextInputAction.next,
            maxLength: 11,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.black54,
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
            textInputAction: TextInputAction.next,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.black54,
            ),
            decoration: inputDecoration("E-mail Address"),
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
            textInputAction: TextInputAction.next,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.black54,
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
            textInputAction: TextInputAction.next,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.black54,
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
            textInputAction: TextInputAction.next,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.black54,
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
            textInputAction: TextInputAction.next,
            maxLength: 11,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.black54,
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
            textInputAction: TextInputAction.done,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.black54,
            ),
            decoration: inputDecoration("E-mail Address"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Student Information"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: state.addStudent,
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color(0xff557A46),Color(0xffffae77)]),
          ),
        ),
      ),
      body: Form(
          key: state.formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              buildStudentForms(),
              CheckboxListTile(
                  dense: true,
                  checkColor: Colors.white70,
                  activeColor: Colors.green,
                  title: const Text("Has guardian?",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),),
                  value: state.hasGuardian,
                  onChanged: state.onHasGuardianChanged),
              if (state.hasGuardian) buildGuardianForms(),
            ],
          )),
    );
  }
}
