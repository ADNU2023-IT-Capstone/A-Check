import 'package:a_check/models/class.dart';
import 'package:a_check/models/student.dart';
import 'package:a_check/pages/controllers/student_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key, required this.studentKey, this.studentClass})
      : super(key: key);

  final String studentKey;
  final Class? studentClass;

  @override
  State<StudentPage> createState() => StudentState();
}

class StudentView extends WidgetView<StudentPage, StudentState> {
  const StudentView(state, {Key? key}) : super(state, key: key);

  Widget buildHeader(Student student) {
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
                        student.toString(),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(student.id),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.face),
                      student.hasRegisteredFace()
                          ? GestureDetector(
                              onLongPress: state.registerFace,
                              child: Checkbox(
                                  value: student.hasRegisteredFace(),
                                  onChanged: (value) {/* do nothing */}),
                            )
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

  Widget buildStudentInfo(Student student) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Student Information",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextField(
          enabled: false,
          decoration:
              const InputDecoration(labelText: "Contact Number", isDense: true),
          controller: TextEditingController(text: student.phone),
        ),
        TextField(
          enabled: false,
          decoration: const InputDecoration(labelText: "E-mail", isDense: true),
          controller: TextEditingController(text: student.email),
        )
      ],
    );
  }

  Widget buildGuardianInfo(Student student) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Guardian Information",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          student.guardian.toString(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        TextField(
          enabled: false,
          decoration:
              const InputDecoration(labelText: "Contact Number", isDense: true),
          controller:
              TextEditingController(text: student.guardian?.phone),
        ),
        TextField(
          enabled: false,
          decoration: const InputDecoration(labelText: "E-mail", isDense: true),
          controller:
              TextEditingController(text: student.guardian?.email),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          state.studentValueNotifier,
      builder: (context, student, _) => Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Student Info"),
              Text(
                student.toString(),
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
                if (widget.studentClass != null)
                  PopupMenuItem(
                      onTap: state.removeFromClass,
                      child: const Text("Remove from class")),
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
            buildHeader(student),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    buildStudentInfo(student),
                    const SizedBox(height: 24),
                    buildGuardianInfo(student)
                  ],
                )),
          ],
        )),
      ),
    );
  }
}
