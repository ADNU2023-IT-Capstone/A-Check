import 'package:a_check/models/school.dart';
import 'package:a_check/pages/class/controllers/attendance_records_state.dart';
import 'package:a_check/themes.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/student_attendance_record_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceRecordsPage extends StatefulWidget {
  const AttendanceRecordsPage({Key? key, required this.records})
      : super(key: key);

  final List<AttendanceRecord> records;

  @override
  State<AttendanceRecordsPage> createState() => AttendanceRecordsState();
}

class AttendanceRecordsView
    extends WidgetView<AttendanceRecordsPage, AttendanceRecordsState> {
  const AttendanceRecordsView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        backgroundColor: Themes.main.colorScheme.background,
        foregroundColor: Themes.main.colorScheme.onBackground,
        elevation: 0,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: state.deleteRecord,
                child: const Text("Delete record"),
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildHeaderBox(),
            buildHeaderColumnRow(),
            const Divider(
              color: Color(0xffe3e3e3),
              height: 0,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Expanded(child: buildRecords()),
          ],
        ),
      ),
    );
  }

  Widget buildRecords() {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
      children: widget.records
          .map((e) => StudentAttendanceRecordCard(record: e))
          .toList(),
    );
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
            child: const Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // PALE
                  Text(
                    "P",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Color(0xff000000),
                    ),
                  ),
                  Text(
                    "A",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Color(0xff000000),
                    ),
                  ),
                  Text(
                    "L",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Color(0xff000000),
                    ),
                  ),
                  Text(
                    "E",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox buildHeaderBox() {
    final textColor = Themes.main.colorScheme.onPrimary;

    return SizedBox(
      height: 120,
      child: Card(
        color: Themes.main.colorScheme.primary,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  DateFormat("MMMM d, y").format(widget.records.first.dateTime),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 30,
                    color: textColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text(
                "${widget.records.length} records",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
