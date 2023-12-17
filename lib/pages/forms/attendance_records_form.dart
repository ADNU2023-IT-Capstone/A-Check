import 'package:a_check/globals.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/pages/class/attendance_records_page.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/utils/attendance_helpers.dart';
import 'package:a_check/widgets/student_attendance_record_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceFormPage extends StatefulWidget {
  const AttendanceFormPage(
      {super.key,
      required this.students,
      required this.classId,
      this.recognizedStudents});

  final List<Student> students;
  final String classId;
  final List<Student>? recognizedStudents;

  @override
  State<AttendanceFormPage> createState() => _AttendanceFormPageState();
}

class _AttendanceFormPageState extends State<AttendanceFormPage> {
  late final List<AttendanceRecord> records;

  @override
  Widget build(BuildContext context) => _AttendanceFormPageView(this);

  @override
  void initState() {
    super.initState();

    records = List.generate(widget.students.length, (index) {
      final id = attendancesRef.doc().id;
      final record = AttendanceRecord(
          id: id,
          studentId: widget.students[index].id,
          classId: widget.classId,
          dateTime: DateTime.now());

      if (widget.recognizedStudents != null) {
        for (var rs in widget.recognizedStudents!) {
          if (rs.id == record.studentId) {
            record.status = AttendanceStatus.Present;
            break;
          }
        }
      }

      return record;
    });
  }

  void finalize() async {
    for (var a in records) {
      if (a.status == AttendanceStatus.unknown) {
        snackbarKey.currentState!.showSnackBar(
            const SnackBar(content: Text("Records must be all filled up!")));

        return;
      }
    }

    snackbarKey.currentState!.showSnackBar(const SnackBar(
        content: Row(children: [
      CircularProgressIndicator(),
      SizedBox(width: 16),
      Text("Saving...")
    ])));
    AttendanceHelpers.recordAttendance(attendances: records)
        .whenComplete(() {
      snackbarKey.currentState!.hideCurrentSnackBar();
      snackbarKey.currentState!.showSnackBar(SnackBar(
          content: Text(
              "Took attendances of ${records.length} student${records.length > 1 ? 's' : ''}")));
    });

    if (mounted) Navigator.pop(context);
  }
}

class _AttendanceFormPageView
    extends WidgetView<AttendanceFormPage, _AttendanceFormPageState> {
  const _AttendanceFormPageView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(child: buildBody()),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: state.finalize,
          icon: const Icon(Icons.event_note),
          label: const Text("Save")),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        title: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Attendance Form"),
        Text(
          DateFormat.yMMMMd().format(DateTime.now()),
          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
        )
      ],
    ));
  }

  Widget buildBody() {
    return Column(
      children: [
        buildLegendCard(),
        buildHeaderColumnRow(),
        const Divider(
          color: Color(0xffe3e3e3),
          height: 0,
          thickness: 1,
          indent: 5,
          endIndent: 5,
        ),
        Expanded(child: buildRecords())
      ],
    );
  }

  ListView buildRecords() {
    return ListView.builder(
      itemCount: state.records.length,
      itemBuilder: (context, index) {
        return StudentAttendanceRecordCard(
          record: state.records[index],
          isLocal: true,
          key: ValueKey<String>(state.records[index].id),
        );
      },
    );
  }

  Widget buildLegendCard() {
    return const Card(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LegendRow(
                  icon: Icons.check_circle,
                  text: "Present",
                  iconColor: Colors.green),
              LegendRow(
                  icon: Icons.close, text: "Absent", iconColor: Colors.red),
              LegendRow(
                  icon: Icons.watch_later,
                  text: "Late",
                  iconColor: Colors.yellow),
              LegendRow(
                  icon: Icons.flag, text: "Excused", iconColor: Colors.orange),
            ],
          ),
        ));
  }

  Row buildHeaderColumnRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 5),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  "Student",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 17,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
              flex: 1,
              child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  decoration: const BoxDecoration(
                    color: Color(0x1fffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // PALE
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.check_circle_rounded,
                          color: Colors.green,
                          size: 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.watch_later_sharp,
                          color: Colors.yellow,
                          size: 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.flag,
                          color: Colors.orange,
                          size: 14,
                        ),
                      ),
                    ],
                  )))
        ]);
  }
}
