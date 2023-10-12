import 'package:a_check/models/class.dart';
import 'package:a_check/pages/controllers/class_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:a_check/widgets/attendance_record_card.dart';
import 'package:a_check/widgets/student_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({Key? key, required this.classKey}) : super(key: key);
  final dynamic classKey;

  @override
  State<ClassPage> createState() => ClassState();
}

class ClassView extends WidgetView<ClassPage, ClassState> {
  const ClassView(state, {Key? key}) : super(state, key: key);

  Widget buildTabBarView(Class mClass) {
    return TabBarView(
      children: [buildStudentsListView(mClass), buildReportsListView(mClass)],
    );
  }

  Widget buildStudentsListView(Class mClass) {
    final students = mClass.getStudents();

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      children: students
          .map((e) => StudentCard(
                student: e,
                studentClass: state.mClass,
              ))
          .toList(),
    );
  }

  Widget buildReportsListView(Class mClass) {
    return ValueListenableBuilder(
        valueListenable: HiveBoxes.attendancesBox().listenable(),
        builder: (context, box, _) {
          final records = mClass.getAttendanceRecords();

          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            children: records.entries
                .map((e) => AttendanceRecordCard(
                    dateTime: e.key, attendanceRecords: e.value))
                .toList(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ValueListenableBuilder(
        valueListenable: state.classValueNotifier,
        builder: (context, classValue, _) => Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${classValue.name} [${classValue.section}]"),
                          Text(
                            "${classValue.code}, ${classValue.getSchedule(context)}",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.group), text: "Student List"),
                Tab(icon: Icon(Icons.assignment), text: "Attendance Records")
              ],
            ),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: state.editClass,
                    child: const Text("Edit class"),
                  ),
                  PopupMenuItem(
                      onTap: state.deleteClass,
                      child: const Text("Delete class")),
                ],
              )
            ],
          ),
          body: SafeArea(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: buildTabBarView(classValue),
                  )
                ]),
          ),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: const IconThemeData(size: 24),
            visible: true,
            curve: Curves.bounceIn,
            children: [
              SpeedDialChild(
                  child: const Icon(Icons.person_add),
                  label: 'Add New Student',
                  onTap: state.addNewStudent),
              SpeedDialChild(
                  child: const Icon(Icons.person_add_alt),
                  label: 'Add Existing Student',
                  onTap: state.addExistingStudent),
              SpeedDialChild(
                  child: const Icon(Icons.check),
                  label: 'Take Attendance',
                  onTap: state.takeAttendance),
            ],
          ),
        ),
      ),
    );
  }
}
