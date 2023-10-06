import 'package:a_check/models/student.dart';
import 'package:a_check/pages/controllers/students_form_state.dart';
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
        title: const Text("Add an existing student"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView(
              children: state.students.keys.map((e) {
                final castedBox = HiveBoxes.studentsBox().values.cast();
                final name = (castedBox.firstWhere((student) => student.id == e) as Student).toString();
                
                return CheckboxListTile(
                    value: state.students[e],
                    title: Text(name),
                    onChanged: (value) => state.checkBoxOnChanged(e, value));
              }).toList(),
            ),
          ),
          Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: state.addSelectedStudents,
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                    ),
                    child: const Text("Add Selected Students"),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
