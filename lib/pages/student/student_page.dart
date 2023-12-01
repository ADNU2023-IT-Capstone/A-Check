import 'package:a_check/models/school_class.dart';
import 'package:a_check/models/person.dart';
import 'package:a_check/pages/student/controllers/student_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key, required this.studentId, this.studentClass})
      : super(key: key);

  final String studentId;
  final SchoolClass? studentClass;

  @override
  State<StudentPage> createState() => StudentState();
}

class StudentView extends WidgetView<StudentPage, StudentState> {
  const StudentView(state, {Key? key}) : super(state, key: key);

  Widget buildHeader(Student student) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        color: Color(0xffD7E5CA),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35.0),
            bottomRight: Radius.circular(35.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: state.registerFace,
            onLongPress: state.removeFace,
            child: Stack(
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.bottomRight,
              fit: StackFit.loose,
              children: [
                Container(
                  height: 112,
                  width: 112,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Color(0xffD7E5CA), Color(0xffF9F3CC)]),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    border: Border.fromBorderSide(BorderSide()),
                  ),
                  // TODO: display image of student from firebase
                  child: const Placeholder(),
                  // child: state.student.facePhotoBytes != null
                  //     ? Image.memory(state.student.facePhotoBytes!)
                  //     : const Icon(Icons.person_add_alt),
                ),
                Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.green[300],
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, 2), blurRadius: 1)
                        ]),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 20,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 20, 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
                        child: Text(
                          student.fullName.toString(),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                            color: Color(0xff8EACCD),
                          ),
                        ),
                      ),
                      Text(
                        student.id,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff8EACCD),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStudentInfo(Student student) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   margin: const EdgeInsets.all(0),
          //   padding: const EdgeInsets.all(0),
          //   width: 400,
          //   height: 35,
          //   decoration: const BoxDecoration(
          //     color: Color(0x00ffffff),
          //     shape: BoxShape.rectangle,
          //     borderRadius: BorderRadius.zero,
          //   ),
          //   child: Card(
          //     margin: const EdgeInsets.all(2.0),
          //     color: const Color(0xffffffff),
          //     shadowColor: const Color(0xffebebeb),
          //     elevation: 2,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(20.0),
          //     ),
          //     child: student.hasRegisteredFace()
          //         ? GestureDetector(
          //             onLongPress: state.registerFace,
          //             child: Checkbox(
          //                 value: student.hasRegisteredFace(),
          //                 onChanged: (value) {/* do nothing */}),
          //           )
          //         : Padding(
          //             padding: const EdgeInsets.only(left: 8),
          //             child: MaterialButton(
          //               onPressed: state.registerFace,
          //               child: const Icon(Icons.camera_alt),
          //             ),
          //           ),
          //   ),
          // ),
          const Text(
            "Student Information",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextField(
            enabled: false,
            decoration: const InputDecoration(
                labelText: "Contact Number", isDense: true),
            controller: TextEditingController(text: student.phoneNumber),
          ),
          TextField(
            enabled: false,
            decoration:
                const InputDecoration(labelText: "E-mail", isDense: true),
            controller: TextEditingController(text: student.email),
          ),
        ],
      ),
    );
  }

  Widget buildGuardianInfo(Student student) {
    return Placeholder();
    // TODO: guardian information using firebase stuff
    // return Padding(
    //   padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 30),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       const Text(
    //         "Guardian Information",
    //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //       ),
    //       Text(
    //         student.guardian.toString(),
    //         style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    //       ),
    //       TextField(
    //         enabled: false,
    //         decoration: const InputDecoration(
    //             labelText: "Contact Number", isDense: true),
    //         controller: TextEditingController(text: student.guardian?.phone),
    //       ),
    //       TextField(
    //         enabled: false,
    //         decoration:
    //             const InputDecoration(labelText: "E-mail", isDense: true),
    //         controller: TextEditingController(text: student.guardian?.email),
    //       )
    //     ],
    //   ),
    // );
  }

  Widget buildClassInfo(Student student) {
    final paleMap = student.getPALEValues(widget.studentClass!.id);
    return FutureBuilder(
      future: paleMap,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text("Present: ${snapshot.data!['present']}"),
              Text("Absent: ${snapshot.data!['absent']}"),
              Text("Late: ${snapshot.data!['late']}"),
              Text("Excused: ${snapshot.data!['excused']}"),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder(
      ref: studentsRef.doc(widget.studentId),
      builder: (context, snapshot, child) {
        if (snapshot.hasData) {
          final student = snapshot.data!.data!;

          return Scaffold(
            backgroundColor: const Color(0xffFFF4F4),
            appBar: AppBar(
              backgroundColor: const Color(0xffD7E5CA),
              foregroundColor: Colors.white,
              elevation: 0,
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    if (widget.studentClass != null)
                      PopupMenuItem(
                          onTap: state.removeFromClass,
                          child: const Text("Remove from class")),
                    PopupMenuItem(
                      onTap: state.editStudent,
                      child: const Text("Edit student"),
                    ),
                    PopupMenuItem(
                      onTap: state.deleteStudent,
                      child: const Text("Delete student"),
                    )
                  ],
                )
              ],
            ),
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(student),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      children: [
                        buildStudentInfo(student),
                        const SizedBox(height: 24),
                        // student.guardian != null
                        //     ? buildGuardianInfo(student)
                        //     : const Text("No guardian!"),
                        if (widget.studentClass != null)
                          buildClassInfo(student),
                      ],
                    )),
              ],
            )),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
    // return ValueListenableBuilder(
    //   valueListenable: state.studentValueNotifier,
    //   builder: (context, student, _) => Scaffold(
    //     backgroundColor: const Color(0xffFFF4F4),
    //     appBar: AppBar(
    //       backgroundColor: const Color(0xffD7E5CA),
    //       foregroundColor: Colors.white,
    //       elevation: 0,
    //       actions: [
    //         PopupMenuButton(
    //           itemBuilder: (context) => [
    //             if (widget.studentClass != null)
    //               PopupMenuItem(
    //                   onTap: state.removeFromClass,
    //                   child: const Text("Remove from class")),
    //             PopupMenuItem(
    //               onTap: state.editStudent,
    //               child: const Text("Edit student"),
    //             ),
    //             PopupMenuItem(
    //               onTap: state.deleteStudent,
    //               child: const Text("Delete student"),
    //             )
    //           ],
    //         )
    //       ],
    //     ),
    //     body: SafeArea(
    //         child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         buildHeader(student),
    //         Padding(
    //             padding:
    //                 const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    //             child: Column(
    //               children: [
    //                 buildStudentInfo(student),
    //                 const SizedBox(height: 24),
    //                 student.guardian != null
    //                     ? buildGuardianInfo(student)
    //                     : const Text("No guardian!"),
    //                 if (widget.studentClass != null) buildClassInfo(student),
    //               ],
    //             )),
    //       ],
    //     )),
    //   ),
    // );
  }
}
