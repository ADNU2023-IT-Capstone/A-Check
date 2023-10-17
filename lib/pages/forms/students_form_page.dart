import 'package:a_check/models/student.dart';
import 'package:a_check/pages/forms/controllers/students_form_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:flutter/material.dart';

class StudentsFormPage extends StatefulWidget {
  const StudentsFormPage({Key? key}) : super(key: key);

  @override
  State<StudentsFormPage> createState() => StudentsFormState();
}

class StudentsFormView extends WidgetView<StudentsFormPage, StudentsFormState> {
  const StudentsFormView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Existing Students"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: state.addSelectedStudents,
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Colors.black, Colors.green]),
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 20, 0),
              children: state.students.keys.map((e) {
                final castedBox = HiveBoxes.studentsBox().values.cast();
                final name = (castedBox.firstWhere((student) => student.id == e) as Student).toString();
                
                return CheckboxListTile(
                    value: state.students[e],
                    tileColor: const Color.fromRGBO(238,238,238, 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.0),
                    ),
                    title: Text(name, style: const TextStyle(letterSpacing: 0.5, fontSize: 14, fontWeight: FontWeight.w400),),
                    checkColor: Colors.white70,
                    activeColor: Colors.green,
                    onChanged: (value) => state.checkBoxOnChanged(e, value));
              }).toList(),
            ),
          ),
        ],
      )),
    );
  }
}
