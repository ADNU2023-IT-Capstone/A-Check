import 'package:a_check/pages/controllers/class_state.dart';
import 'package:a_check/models/class.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/attendance_record_card.dart';
import 'package:a_check/widgets/student_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({Key? key, required this.mClass}) : super(key: key);
  final Class mClass;

  @override
  State<ClassPage> createState() => ClassState();
}

class ClassView extends WidgetView<ClassPage, ClassState> {
  const ClassView(state, {Key? key}) : super(state, key: key);

  Widget buildTabBarView() {
    return TabBarView(
      children: [buildStudentsListView(), buildReportsListView()],
    );
  }

  Widget buildStudentsListView() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      children: state.students.map((e) => StudentCard(student: e)).toList(),
    );
  }

  Widget buildReportsListView() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      children: const [AttendanceRecordCard(), AttendanceRecordCard()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: state.backButtonPressed,
                          child: const Icon(Icons.arrow_back)),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(widget.mClass.name),
                                Text(widget.mClass.section),
                                Text(widget.mClass.code)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.group)),
                    Tab(icon: Icon(Icons.assignment))
                  ],
                  labelColor: Colors.black,
                ),
                Expanded(
                  child: buildTabBarView(),
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
    );
  }
}
