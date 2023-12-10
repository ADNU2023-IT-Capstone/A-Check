import 'package:a_check/models/school.dart';
import 'package:a_check/pages/student/controllers/student_state.dart';
import 'package:a_check/themes.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: buildBody());
  }

  AppBar buildAppBar() {
    return AppBar(
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
    );
  }

  Widget buildBody() {
    return SafeArea(
        child: FirestoreBuilder(
      ref: studentsRef.doc(widget.studentId),
      builder: (context, snapshot, child) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            final student = snapshot.data!.data!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(student),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
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
            );
          } else {
            return const Center(
              child: Text("Failed to get student information"),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }

  Widget buildHeader(Student student) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: Themes.main.colorScheme.primary,
          boxShadow: const [BoxShadow(spreadRadius: 2, blurRadius: 5)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          buildStudentPhoto(student),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 30, vertical: 20),
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
                      Text(
                        student.fullName.toString(),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          color: Themes.main.colorScheme.onPrimary,
                        ),
                      ),
                      Text(
                        student.id,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Themes.main.colorScheme.onPrimary,
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

  Stack buildStudentPhoto(Student student) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 192,
          height: 192,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          clipBehavior: Clip.antiAlias,
          child: FutureBuilder(
              future: student.getPhotoUrl(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final url = snapshot.data!;
  
                  return CircleAvatar(
                    foregroundImage: url.isEmpty ? NetworkImage(url) : null,
                    child: Text(
                      student.initials,
                      style: const TextStyle(fontSize: 80),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
        Material(
          borderRadius: BorderRadius.circular(100),
          elevation: 2,
          child: InkWell(
            onTap: state.registerFace,
            onLongPress: state.removeFace,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.camera_alt,
                size: 32,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildStudentInfo(Student student) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Student Information",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text(student.email!),
              leading: const Icon(Icons.email),
              onTap: () => state.copyToClipboard(student.email!),
            ),
            ListTile(
              title: Text(student.phoneNumber!),
              leading: const Icon(Icons.phone),
              onTap: () => state.copyToClipboard(student.phoneNumber!),
            ),
          ],
        )
      ],
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
}
