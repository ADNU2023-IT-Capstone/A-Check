import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/pages/class/controllers/attendance_records_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/student_attendance_record_card.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: const Color(0xffF2E3DB),
        appBar: AppBar(
          leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
          backgroundColor: const Color(0xffF2E3DB),
          foregroundColor: Colors.black87,
          elevation: 0,
          // title: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     const Text("Attendance Record"),
          //     Text(
          //       DateFormat("MMMM d, y").format(widget.records.first.dateTime),
          //       style: const TextStyle(
          //         fontSize: 12,
          //         fontWeight: FontWeight.normal,
          //       ),
          //     )
          //   ],
          // ),
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
        body:Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child:Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisSize:MainAxisSize.min,
          children: [
            Container(
              margin:const EdgeInsets.fromLTRB(0, 0, 0, 0),
              padding:const EdgeInsets.fromLTRB(0, 20, 0, 0),
              // width:400,
              height: 160,

              child: Card(
                margin: const EdgeInsets.all(4.0),
                color: const Color(0xff41644A),
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              child:
              const Column(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.start,
                mainAxisSize:MainAxisSize.max,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                      child: Align(
                        alignment:Alignment.centerLeft,
                        child:Text(
                          "February 17, 2023",
                          textAlign: TextAlign.left,
                          overflow:TextOverflow.clip,
                          style:TextStyle(
                            fontWeight:FontWeight.w600,
                            fontStyle:FontStyle.normal,
                            fontSize:30,
                            color: Color(0xffF2E3DB),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding:EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child:Text(
                      "13 members",
                      textAlign: TextAlign.start,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w400,
                        fontStyle:FontStyle.normal,
                        fontSize:15,
                        color:Color(0xffF2E3DB),
                      ),
                    ),
                  ),
                ],),
    ),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisSize:MainAxisSize.max,
              children:[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment:Alignment.centerLeft,
                    padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 5),
                    child:
                    const Padding(
                      padding:EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:Text(
                        "Student",
                        textAlign: TextAlign.center,
                        overflow:TextOverflow.clip,
                        style:TextStyle(
                          fontWeight:FontWeight.w500,
                          fontStyle:FontStyle.normal,
                          fontSize:17,
                          color:Color(0xff000000),
                        ),
                      ),
                    ),
                  ),),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment:Alignment.centerLeft,
                    padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                    decoration: const BoxDecoration(
                      color:Color(0x1fffffff),
                      shape:BoxShape.rectangle,
                      borderRadius:BorderRadius.zero,
                    ),
                    child:
                    const Padding(
                      padding:EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child:Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:CrossAxisAlignment.center,
                        mainAxisSize:MainAxisSize.max,
                        children:[ // PALE
                          Text(
                            "P",
                            textAlign: TextAlign.start,
                            overflow:TextOverflow.clip,
                            style:TextStyle(
                              fontWeight:FontWeight.w400,
                              fontStyle:FontStyle.normal,
                              fontSize:15,
                              color:Color(0xff000000),
                            ),
                          ),
                          Text(
                            "A",
                            textAlign: TextAlign.start,
                            overflow:TextOverflow.clip,
                            style:TextStyle(
                              fontWeight:FontWeight.w400,
                              fontStyle:FontStyle.normal,
                              fontSize:15,
                              color:Color(0xff000000),
                            ),
                          ),
                          Text(
                            "L",
                            textAlign: TextAlign.start,
                            overflow:TextOverflow.clip,
                            style:TextStyle(
                              fontWeight:FontWeight.w400,
                              fontStyle:FontStyle.normal,
                              fontSize:15,
                              color:Color(0xff000000),
                            ),
                          ),
                          Text(
                            "E",
                            textAlign: TextAlign.start,
                            overflow:TextOverflow.clip,
                            style:TextStyle(
                              fontWeight:FontWeight.w400,
                              fontStyle:FontStyle.normal,
                              fontSize:15,
                              color:Color(0xff000000),
                            ),
                          ),
                        ],),),
                  ),),
              ],),
            const Divider(
              color:Color(0xffe3e3e3),
              height:0,
              thickness:1,
              indent:20,
              endIndent:20,
            ),
            // SizedBox (
            //   height: 200,
            //   child: Row(
            //   mainAxisAlignment:MainAxisAlignment.start,
            //   crossAxisAlignment:CrossAxisAlignment.center,
            //   mainAxisSize:MainAxisSize.max,
            //   children:[
            //     ListView(
            //       shrinkWrap: true,
            //       padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            //       children: widget.records
            //           .map((e) => StudentAttendanceRecordCard(record: e))
            //           .toList(),
            //     )
            //   ],),),
            Column(
                children: [
              Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        child: ListView(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 0, horizontal:0),
                            children: widget.records
                                .map((e) => StudentAttendanceRecordCard(record: e))
                                .toList(),
                          )
                        ),
                      ],
                    ),
                  ],
                ),
          ],),),
        );
  }
}
