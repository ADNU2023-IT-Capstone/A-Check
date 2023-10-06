import 'package:a_check/models/student.dart';
import 'package:a_check/pages/controllers/student_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key, required this.student}) : super(key: key);

  final Student student;

  @override
  State<StudentPage> createState() => StudentState();
}

class StudentView extends WidgetView<StudentPage, StudentState> {
  const StudentView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(widget.student.toString()),
                    Text(widget.student.id),
                    Text("Has registered face? (${widget.student.hasRegisteredFace()})"),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: state.registerFace, child: const Text("Register face")),
        ],
      )),
    );
  }
}
