import 'package:a_check/globals.dart';
import 'package:a_check/models/student.dart';
import 'package:a_check/pages/face_recognition_page.dart';
import 'package:a_check/pages/forms/student_form_page.dart';
import 'package:a_check/pages/student/student_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StudentState extends State<StudentPage> {
  late Student student;
  late StudentValueNotifier studentValueNotifier;

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
      widget.studentClass!.studentIds.remove(student.id);
      widget.studentClass!.save();
    }

    if (context.mounted) {
      studentValueNotifier.removeListener(onStudentValueChanged);
      student.delete().then((_) {
        Navigator.pop(context);
      });
    }
  }

  void registerFace() async {
    if (student.hasRegisteredFace()) {
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
            builder: (context) => FaceRecognitionPage(isRealtime: false, student: student)));

    if (result == null) return;
    if (result == true) {
      showSuccessSnackBar();
    } else if (result['result'] == false) {
      showFailedSnackBar(result['error']);
    }
  }

  void removeFace() async {
    if (student.hasRegisteredFace()) {
      final result = await Dialogs.showConfirmDialog(
          context,
          const Text("Warning"),
          Text("${student.firstName}'s face data will be deleted. Continue?"));
      if (result == null || !result) {
        return;
      } else {
        student.deleteFace();
        snackbarKey.currentState!.showSnackBar(SnackBar(
            content: Text("Deleted ${student.firstName}'s face data.")));
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
            "${student.firstName} will be removed to class ${widget.studentClass!.code}. Continue?"));
    if (result == null || !result) {
      return;
    }

    widget.studentClass!.studentIds.remove(student.id);
    widget.studentClass!.save();

    if (context.mounted) Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    student = HiveBoxes.studentsBox().get(widget.studentKey);
    studentValueNotifier = StudentValueNotifier(student);

    HiveBoxes.studentsBox()
        .listenable(keys: [student.key]).addListener(onStudentValueChanged);
  }

  void onStudentValueChanged() {
    if (mounted) {
      setState(() {
        student = HiveBoxes.studentsBox().get(widget.studentKey);
        studentValueNotifier.value = student;
      });
    }
  }

  @override
  void dispose() {
    studentValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StudentView(this);
}
