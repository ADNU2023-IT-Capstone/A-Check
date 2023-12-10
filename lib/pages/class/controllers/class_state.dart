import 'dart:async';

import 'package:a_check/globals.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/pages/auto_attendance/auto_attendance_page.dart';
import 'package:a_check/pages/take_attendance/face_recognition_page.dart';
import 'package:a_check/pages/class/class_page.dart';
import 'package:flutter/material.dart';

class ClassState extends State<ClassPage> {
  late SchoolClass schoolClass;
  late StreamSubscription classesStream, attendancesStream;

  @override
  void initState() {
    super.initState();

    schoolClass = widget.schoolClass;

    classesStream = classesRef.doc(schoolClass.id).snapshots().listen((event) {
      if (context.mounted) {
        setState(() {
          schoolClass = event.data!;
        });
      }
    });

    attendancesStream = attendancesRef
        .whereClassId(isEqualTo: widget.schoolClass.id)
        .snapshots()
        .listen((event) {
      if (context.mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();

    classesStream.cancel();
    attendancesStream.cancel();
  }

  @override
  Widget build(BuildContext context) => ClassView(this);

  void backButtonPressed() {
    Navigator.pop(context);
  }

  void takeAttendance() async {
    if (schoolClass.studentIds.isEmpty) {
      snackbarKey.currentState!
          .showSnackBar(const SnackBar(content: Text("You have no students!")));
      return;
    }

    final students = await schoolClass.getStudents();
    bool hasRegisteredFaces = false;
    for (var student in students) {
      if (student.faceArray.isNotEmpty) {
        hasRegisteredFaces = true;
        break;
      }
    }

    if (hasRegisteredFaces) {
      if (context.mounted) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FaceRecognitionPage(schoolClass: schoolClass)));
      }
    } else {
      snackbarKey.currentState!.showSnackBar(const SnackBar(
          content: Text(
              "You do not have at least a student with a registered face!")));
    }
  }

  void exportRecords() {}

  void autoAttendance() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AutoAttendancePage(
            schoolClass: schoolClass,
          ),
        ));
  }
}
