import 'package:a_check/models/school.dart';
import 'package:a_check/pages/student/controllers/student_state.dart';
import 'package:a_check/themes.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
            if (state.student.guardian == null)
              PopupMenuItem(
                onTap: state.guardianForm,
                child: const Text("Add guardian"),
              )
            else
              PopupMenuItem(
                onTap: state.guardianForm,
                child: const Text("Edit guardian"),
              )
          ],
        )
      ],
    );
  }

  Widget buildBody() {
    return SafeArea(
        child: StreamBuilder(
      stream: studentsRef.doc(widget.studentId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            final student = snapshot.data!.data!;

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeader(student),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: Column(
                        children: [
                          if (widget.studentClass != null)
                            buildClassInfo(student),
                          const SizedBox(height: 20),

                          buildStudentInfo(student),
                          const SizedBox(height: 20),
                          const SizedBox(height: 50),
                          buildGuardianInfo(student),
                          // if (widget.studentClass != null)
                          //   buildClassInfo(student),
                        ],
                      )),
                ],
              ),
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
        mainAxisSize: MainAxisSize.min,
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
                    mainAxisSize: MainAxisSize.min,
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
                  if (url.isNotEmpty) {
                    return CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) =>
                          CircularProgressIndicator(value: progress.progress),
                      errorWidget: (context, url, error) => const Column(
                        children: [
                          Icon(Icons.error_outline),
                          Text("Failed to load image")
                        ],
                      ),
                    );
                  } else {
                    return CircleAvatar(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          student.initials,
                          style: const TextStyle(fontSize: 80),
                        ),
                      ),
                    );
                  }
                } else {
                  return CircleAvatar(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        student.initials,
                        style: const TextStyle(fontSize: 80),
                      ),
                    ),
                  );
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
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left:8.0),
              child: Text(
                "Student Information",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),

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
        ),
      ),
    );
  }

  Widget buildGuardianInfo(Student student) {
    if (student.guardian == null) {
      return const Center(
        child: Text("Sorry, we couldn't find your guardian.", style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Guardian Information",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListTile(
          title: Text(student.guardian!.email ?? "None"),
          leading: const Icon(Icons.email),
          onTap: () => state.copyToClipboard(student.guardian!.email),
        ),
        ListTile(
          title: Text(student.guardian!.phoneNumber ?? "None"),
          leading: const Icon(Icons.phone),
          onTap: () => state.copyToClipboard(student.guardian!.phoneNumber),
        ),
      ],
    );
  }

  Widget buildClassInfo(Student student) {
    final paleMap = student.getPALEValues(widget.studentClass!.id);
    return FutureBuilder(
      future: paleMap,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 80,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xff008744)), //green color
                    child: TextButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          // If the button is pressed, return green, otherwise blue
                          if (states.contains(MaterialState.pressed)) {
                            return const Color(0xff008744);
                          }
                          return const Color(0xff008744);
                        }),
                        textStyle: MaterialStateProperty.resolveWith((states) {
                          // If the button is pressed, return size 40, otherwise 20
                          if (states.contains(MaterialState.pressed)) {
                            return const TextStyle(fontSize: 13);
                          }
                          return const TextStyle(fontSize: 12);
                        }),
                      ),
                      onPressed: () => state.showDatesWhereStatus(status: AttendanceStatus.Present),
                      icon: Text(snapshot.data!['present'].toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                      label: const Text("Present", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 6,),
                  Container(
                    width: 80,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffd62d20)), //red color
                    child: TextButton.icon(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return 1;
                          }
                          return 1.5;
                        }),
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const Color(0xffd62d20);
                          }
                          return const Color(0xffd62d20);
                        }),
                        textStyle: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const TextStyle(fontSize: 13);
                          }
                          return const TextStyle(fontSize: 12);
                        }),
                      ),
                      onPressed: () => state.showDatesWhereStatus(status: AttendanceStatus.Absent),
                      icon: Text(snapshot.data!['absent'].toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                      label: const Text("Absent", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 6,),
                  Container(
                    width: 80,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffffa700)), //yellow color
                    child: TextButton.icon(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return 1;
                          }
                          return 1.5;
                        }),
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const Color(0xffffa700);
                          }
                          return const Color(0xffffa700);
                        }),
                        textStyle: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const TextStyle(fontSize: 13);
                          }
                          return const TextStyle(fontSize: 12);
                        }),
                      ),
                      onPressed: () => state.showDatesWhereStatus(status: AttendanceStatus.Late),
                      icon: Text(snapshot.data!['late'].toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                      label: const Text("Late",style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 6,),
                  Container(
                    width: 80,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xff0057e7)),
                    child: TextButton.icon(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return 1;
                          }
                          return 1.5;
                        }),
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const Color(0xff0057e7);
                          }
                          return const Color(0xff0057e7);
                        }),
                        textStyle: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const TextStyle(fontSize: 13);
                          }
                          return const TextStyle(fontSize: 12);
                        }),
                      ),
                      onPressed: () => state.showDatesWhereStatus(status: AttendanceStatus.Excused),
                      icon: Text(snapshot.data!['excused'].toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                      label: const Text("Excused", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 6,),
                ],
              ),
              const SizedBox(height: 20,),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
