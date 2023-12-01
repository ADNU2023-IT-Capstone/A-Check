import 'package:a_check/globals.dart';
import 'package:a_check/models/person.dart';
import 'package:a_check/models/school_class.dart';
import 'package:a_check/pages/face_recognition_page.dart';
import 'package:a_check/pages/forms/student_form_page.dart';
import 'package:a_check/pages/student/student_page.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:flutter/material.dart';

class StudentState extends State<StudentPage> {
  late Student student;

  void showSuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Successfully registered ${student.firstName}'s face!")));
  }

  void showFailedSnackBar(error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Something went wrong with saving ${student.firstName}'s face...\n$error")));
  }

  void editStudent() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentFormPage(student: student),
        ));
  }

  void deleteStudent() async {
    final result = await Dialogs.showConfirmDialog(
        context,
        const Text("Delete Student"),
        const Text("This will delete the student and its data. Continue?"));

    if (result == null || !result) {
      return;
    }

    if (widget.studentClass != null) {
      final newStudentIds = widget.studentClass!.studentIds;
      newStudentIds.remove(student.id);

      classesRef.doc(widget.studentClass!.id).update(studentIds: newStudentIds);
    }

    if (context.mounted) {
      studentsRef.doc(student.id).delete().then((_) {
        Navigator.pop(context);
      });
    }
  }

  void registerFace() async {
    if (student.faceArray.isNotEmpty) {
      final result = await Dialogs.showConfirmDialog(
          context,
          const Text("Warning"),
          Text(
              "${student.firstName} already has a face registered. Continue?"));
      if (result == null || !result) {
        return;
      }
    }

    if (!context.mounted) return;
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FaceRecognitionPage(student: student)));

    if (result == null) return;
    if (result == true) {
      showSuccessSnackBar();
    } else if (result['result'] == false) {
      showFailedSnackBar(result['error']);
    }

    _initStudent();
  }

  void removeFace() async {
    if (student.faceArray.isNotEmpty) {
      final result = await Dialogs.showConfirmDialog(
          context,
          const Text("Warning"),
          Text("${student.firstName}'s face data will be deleted. Continue?"));
      if (result == null || !result) {
        return;
      } else {
        studentsRef.doc(student.id).update(faceArray: List.empty()).then((_) {
          snackbarKey.currentState!.showSnackBar(SnackBar(
              content: Text("Deleted ${student.firstName}'s face data.")));
        });
        _initStudent();
      }
    } else {
      return;
    }
  }

  void removeFromClass() async {
    final result = await Dialogs.showConfirmDialog(
        context,
        const Text("Warning"),
        Text(
            "${student.firstName} will be removed to class ${widget.studentClass!.id}. Continue?"));
    if (result == null || !result) {
      return;
    }

    final newStudentIds = widget.studentClass!.studentIds;
    newStudentIds.remove(student.id);

    classesRef
        .doc(widget.studentClass!.id)
        .update(studentIds: newStudentIds)
        .then((_) {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();

    _initStudent();
  }

  void _initStudent() {
    studentsRef.doc(widget.studentId).get().then((value) {
      setState(() => student = value.data!);
    });
  }

  @override
  Widget build(BuildContext context) => StudentView(this);
}
