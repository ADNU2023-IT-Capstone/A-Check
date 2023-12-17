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
                onTap: state.exportRecord,
                child: const Text("Export record"),
              )
            ],
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                buildHeaderBox(),
              ],
            ),
          ),
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

  Widget buildRecords() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
      itemCount: widget.records.length,
      itemBuilder: (context, index) {
        return StudentAttendanceRecordCard(record: widget.records[index], isLocal: false,);
      },
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

  Widget buildHeaderBox() {
    final textColor = Themes.main.colorScheme.onPrimary;

    return Column(
      children: [
        Card(
          color: Themes.main.colorScheme.primary,
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      DateFormat("MMMM d, y")
                          .format(widget.records.first.dateTime),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                        color: textColor,
                      ),
                    ),
                    Text(
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
                  ],
                ),
              ],
            ),
          ),
        ),
        buildLegendCard()
      ],
    );
  }
}

class LegendRow extends StatelessWidget {
  const LegendRow({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    this.textColor,
  });

  final IconData icon;
  final String text;
  final Color? iconColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 14,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 15,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
