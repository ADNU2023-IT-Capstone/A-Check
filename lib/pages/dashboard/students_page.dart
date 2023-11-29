import 'package:a_check/models/person.dart';
import 'package:a_check/pages/dashboard/controllers/students_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/student_card.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => StudentsState();
}

class StudentsView extends WidgetView<StudentsPage, StudentsState> {
  const StudentsView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF4F4),
      body: SafeArea(
        child: FirestoreBuilder(
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Students",
                    style: TextStyle(
                        color: Color(0xff557A46),
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
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 27),
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.lightGreen,
        spacing: 10.00,
        childMargin: const EdgeInsets.all(10),
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.person_add),
              label: "Add Student",
              foregroundColor: Colors.green[900],
              onTap: state.addStudent),
        ],
      ),
    );
  }
}
