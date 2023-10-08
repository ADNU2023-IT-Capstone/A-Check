import 'package:a_check/models/class.dart';
import 'package:a_check/models/student.dart';
import 'package:a_check/pages/controllers/student_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key, required this.student, this.studentClass})
      : super(key: key);

  final Student student;
  final Class? studentClass;

  @override
  State<StudentPage> createState() => StudentState();
}

class StudentView extends WidgetView<StudentPage, StudentState> {
  const StudentView(state, {Key? key}) : super(state, key: key);

  Widget buildHeader() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Material(
            elevation: 4,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.student.toString(),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.student.id),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.face),
                      widget.student.hasRegisteredFace()
                          ? Checkbox(
                              value: widget.student.hasRegisteredFace(),
                              onChanged: (value) {})
                          : Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: ElevatedButton(
                                onPressed: state.registerFace,
                                child: const Icon(Icons.camera_alt)),
                          ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Student Information",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextField(
            enabled: false,
            decoration: const InputDecoration(
                labelText: "Contact Number", isDense: true),
            controller: TextEditingController(text: widget.student.phone),
          ),
          TextField(
            enabled: false,
            decoration:
                const InputDecoration(labelText: "E-mail", isDense: true),
            controller: TextEditingController(text: widget.student.phone),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Student Info"),
            Text(
              widget.student.toString(),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: state.editStudent,
                child: const Text("Edit student"),
              )
            ],
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          buildInfo(),
          if (widget.studentClass != null)
            ElevatedButton(
                onPressed: state.removeFromClass,
                child: Text("Remove from ${widget.studentClass!.code}"))
        ],
      )),
    );
  }
}
