import 'package:a_check/models/school.dart';
import 'package:a_check/pages/forms/controllers/guardian_form_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/validators.dart';

class GuardianFormPage extends StatefulWidget {
  const GuardianFormPage({Key? key, required this.student}) : super(key: key);

  final Student student;
  
  @override
  State<GuardianFormPage> createState() => GuardianFormState();
}

class GuardianFormView extends WidgetView<GuardianFormPage, GuardianFormState> {
  const GuardianFormView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Student Information"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: state.setGuardian,
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color(0xff557A46), Color(0xffffae77)]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: buildForm(),
      ),
    );
  }

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

  Widget buildForm() {
    return Form(
      key: state.formKey,
      child: Column(
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
              controller: state.firstNameCon,
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
              controller: state.middleNameCon,
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
              controller: state.lastNameCon,
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
              controller: state.phoneNumCon,
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
              controller: state.emailCon,
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
      ),
    );
  }
}
