import 'package:a_check/globals.dart';
import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/models/school_class.dart';
import 'package:a_check/pages/face_recognition_page.dart';
import 'package:a_check/pages/forms/class_form_page.dart';
import 'package:a_check/pages/class/class_page.dart';
import 'package:a_check/pages/forms/student_form_page.dart';
import 'package:a_check/pages/forms/students_form_page.dart';
import 'package:a_check/utils/dialogs.dart';
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

  void addNewStudent() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StudentFormPage(
                  currentClass: schoolClass,
                )));
  }

  void addExistingStudent() async {
    final List<String>? result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const StudentsFormPage()));

    if (result == null || result.isEmpty) return;

    final newStudentIds = schoolClass.studentIds;
    newStudentIds.addAll(result);

    classesRef
        .doc(schoolClass.id)
        .update(studentIds: newStudentIds)
        .whenComplete(() => setState(() {}));
  }

  void editClass() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClassFormPage(
            schoolClass: schoolClass,
          ),
        ));
  }

  void deleteClass() async {
    final result = await Dialogs.showConfirmDialog(
        context,
        const Text("Delete Class"),
        const Text(
            "This will delete the class and its related data. Continue?"));
    if (result == null || !result) {
      return;
    }

    (await schoolClass.getAttendanceRecords())
        .forEach((_, attendanceRecords) async {
      for (var record in attendanceRecords) {
        await attendancesRef.doc(record.id).delete();
      }
    });

    if (context.mounted) {
      classesRef.doc(schoolClass.id).delete().then((_) {
        snackbarKey.currentState!.showSnackBar(
            SnackBar(content: Text("Deleted ${schoolClass.id}.")));
        Navigator.pop(context);
      });
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
}
