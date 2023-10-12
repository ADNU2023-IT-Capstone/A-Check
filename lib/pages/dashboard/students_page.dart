import 'package:a_check/models/student.dart';
import 'package:a_check/pages/dashboard/controllers/students_state.dart';
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
        child: ValueListenableBuilder(
            valueListenable: HiveBoxes.studentsBox().listenable(),
            builder: (context, box, _) {
              final castedBox = box.values.cast();
              final studentsList = castedBox.map((e) => e as Student).toList();
              studentsList.sort(
                (a, b) => a.firstName[0]
                    .toLowerCase()
                    .compareTo(b.firstName[0].toLowerCase()),
              );

              return ListView(padding: const EdgeInsets.all(8), children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Students",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                for (var student in studentsList) StudentCard(student: student),
              ]);
            }),
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
          SpeedDialChild(
              child: const Icon(Icons.camera_indoor),
              label: "IP Camera",
              onTap: state.openIPCam),
          SpeedDialChild(
              child: const Icon(Icons.camera_alt),
              label: "Phone Camera",
              onTap: state.openPhoneCam),
        ],
      ),
    );
  }
}
