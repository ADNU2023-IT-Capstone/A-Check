import 'package:a_check/models/class.dart';
import 'package:a_check/pages/class/controllers/class_state.dart';
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
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
            backgroundColor: Colors.white60,
            foregroundColor: Colors.black87,
            elevation: 0,
            // title: Row(
            //   mainAxisSize: MainAxisSize.max,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Expanded(
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text("${classValue.name} [${classValue.section}]"),
            //               Text(
            //                 "${classValue.code}, ${classValue.getSchedule(context)}",
            //                 style: const TextStyle(
            //                   fontSize: 12,
            //                   fontWeight: FontWeight.normal,
            //                 ),
            //               )
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            bottom:
            const TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(child: Text( "Student List", style: TextStyle(color: Colors.black)) ),
                Tab(child: Text( "Attendance Records", style: TextStyle(color: Colors.black)))
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
          body: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisSize:MainAxisSize.max,
            children: [
              Container(
                margin:const EdgeInsets.fromLTRB(0, 30, 0,20),
                padding:const EdgeInsets.all(0),
                width:360,
                height:100,
                decoration: const BoxDecoration(
                  color:Color(0x1fffffff),
                  shape:BoxShape.rectangle,
                  borderRadius:BorderRadius.zero,
                ),
                child:

                Column(
                  mainAxisAlignment:MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisSize:MainAxisSize.max,
                  children: [
                    Align(
                      alignment:Alignment.center,
                      child:Text(
                        classValue.code,
                        textAlign: TextAlign.left,
                        overflow:TextOverflow.clip,
                        style:const TextStyle(
                          fontWeight:FontWeight.w300,
                          fontStyle:FontStyle.normal,
                          fontSize:24,
                          color:Color(0xff000000),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height:20,
                      width:16,
                    ),
                    Padding(
                      padding:const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child:Text(
                        classValue.name,
                        textAlign: TextAlign.start,
                        overflow:TextOverflow.clip,
                        style:const TextStyle(
                          fontWeight:FontWeight.w900,
                          fontSize:26,
                          color:Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:Text(
                        "${classValue.section}, ${classValue.getSchedule(context)}",
                        textAlign: TextAlign.start,
                        overflow:TextOverflow.clip,
                        style:const TextStyle(
                          fontWeight:FontWeight.w400,
                          fontStyle:FontStyle.normal,
                          fontSize:14,
                          color:Colors.green,
                        ),
                      ),
                    ),
                  ],),
              ),
              const Row(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,

                // children:[
                //   Expanded( // STUDENTS TAB
                //     flex: 1,
                //     child: MaterialButton(
                //       onPressed:(){},
                //       color:const Color(0xffffffff),
                //       elevation:0,
                //       shape:const RoundedRectangleBorder(
                //         borderRadius:BorderRadius.zero,
                //       ),
                //       padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //       textColor:const Color(0xff000000),
                //       height:40,
                //       minWidth:140,
                //       child:
                //         const Text("Students", style: TextStyle(
                //           fontSize:14,
                //           fontWeight:FontWeight.w400,
                //           fontStyle:FontStyle.normal,
                //       ),),
                //     ),
                //   ),
                //   Expanded( // RECORDS TAB
                //     flex: 1,
                //     child: MaterialButton(
                //       onPressed:(){},
                //       color:const Color(0xfff2f2f2),
                //       elevation:0,
                //       shape:const RoundedRectangleBorder(
                //         borderRadius:BorderRadius.zero,
                //       ),
                //       padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //       textColor:const Color(0xff000000),
                //       height:40,
                //       minWidth:140,
                //       child:
                //         const Text("Records", style: TextStyle( fontSize:14,
                //         fontWeight:FontWeight.w400,
                //         fontStyle:FontStyle.normal,
                //       ),),
                //     ),
                //   ),
                // ],
                ),
                Expanded(
                    child: buildTabBarView(classValue),
                ),
            ],),
          // SafeArea(
          //   child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         Container(
          //           margin: EdgeInsets.zero,
          //           padding: EdgeInsets.zero,
          //           width: 400,
          //           height: 100,
          //           decoration: BoxDecoration(
          //             shape: BoxShape.rectangle,
          //             borderRadius: BorderRadius.zero,
          //             border: Border.all(color: Colors.black, width: 1),
          //           ),
          //         ),
          //         Expanded(
          //           child: buildTabBarView(classValue),
          //         ),
          //       ],
          //   ),
          // ),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: const IconThemeData(size: 30),
            backgroundColor: Colors.green[900],
            foregroundColor: Colors.lightGreen[400],
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
