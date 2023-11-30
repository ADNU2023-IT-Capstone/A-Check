import 'package:a_check/pages/forms/controllers/students_form_state.dart';
import 'package:a_check/utils/abstracts.dart';
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
                colors: <Color>[Color(0xff557A46),Color(0xffffae77)]),
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 20, 0),
              children: state.studentsMap.keys.map((e) {
                final name = state.studentsList.firstWhere((student) => student.id == e).toString();
                
                return CheckboxListTile(
                    value: state.studentsMap[e],
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
