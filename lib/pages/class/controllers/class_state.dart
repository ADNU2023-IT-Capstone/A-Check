import 'package:a_check/globals.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/pages/face_recognition_page.dart';
import 'package:a_check/pages/class/class_page.dart';
import 'package:flutter/material.dart';

class ClassState extends State<ClassPage> {
  late SchoolClass schoolClass;

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

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      schoolClass = (await classesRef.doc(widget.classId).get()).data!;
    });
  }

  @override
  Widget build(BuildContext context) => ClassView(this);

  void exportRecords() {
  }
}
