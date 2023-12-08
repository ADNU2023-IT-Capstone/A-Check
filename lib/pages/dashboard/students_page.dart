import 'package:a_check/models/person.dart';
import 'package:a_check/pages/dashboard/controllers/students_state.dart';
import 'package:a_check/themes.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/student_card.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => StudentsState();
}

class StudentsView extends WidgetView<StudentsPage, StudentsState> {
  const StudentsView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return buildStudentsList();
  }

  FirestoreBuilder<StudentQuerySnapshot> buildStudentsList() {
    return FirestoreBuilder(
        ref: studentsRef,
        builder: (context, snapshot, child) {
          if (snapshot.hasData) {
            final students = snapshot.data!.docs.map((e) => e.data).toList();
            students.sort(
              (a, b) => a.firstName[0]
                  .toLowerCase()
                  .compareTo(b.firstName[0].toLowerCase()),
            );

            return ListView(padding: const EdgeInsets.all(20), children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Students",
                  style: TextStyle(
                      color: Themes.main.colorScheme.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              for (var student in students) StudentCard(student: student),
            ]);
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
  }
}
