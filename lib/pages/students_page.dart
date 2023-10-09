import 'package:a_check/models/student.dart';
import 'package:a_check/pages/controllers/students_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:a_check/widgets/student_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Students",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ValueListenableBuilder(
                  valueListenable: HiveBoxes.studentsBox().listenable(),
                  builder: (context, box, _) {
                    final castedBox = box.values.cast();
                    final studentsList =
                        castedBox.map((e) => e as Student).toList();
                    studentsList.sort(
                      (a, b) => a.firstName[0]
                          .toLowerCase()
                          .compareTo(b.firstName[0].toLowerCase()),
                    );

                    return ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 8),
                        children: studentsList
                            .map((e) => StudentCard(student: e))
                            .toList());
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 24),
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.person_add),
              label: "Add Student",
              onTap: state.addStudent),
        ],
      ),
    );
  }
}
