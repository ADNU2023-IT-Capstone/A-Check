import 'package:a_check/globals.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/pages/take_attendance/face_recognition_page.dart';
import 'package:a_check/pages/forms/guardian_form_page.dart';
import 'package:a_check/pages/student/student_page.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class StudentState extends State<StudentPage> {
  late Student student;

  @override
  Widget build(BuildContext context) => StudentView(this);

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

  void showSuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Successfully registered ${student.firstName}'s face!")));
  }

  void showFailedSnackBar(error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Something went wrong with saving ${student.firstName}'s face...\n$error")));
  }

  void guardianForm() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GuardianFormPage(
            student: student,
          ),
        ));

    _initStudent();
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

  copyToClipboard(value) {
    Clipboard.setData(ClipboardData(text: value)).then((_) {
      snackbarKey.currentState!
          .showSnackBar(SnackBar(content: Text("Copied $value!")));
    });
  }

  showDatesWhereStatus({required AttendanceStatus status}) async {
    final records = (await attendancesRef
            .whereStudentId(isEqualTo: widget.studentId)
            .whereStatus(isEqualTo: status)
            .orderByDateTime()
            .get())
        .docs
        .map((e) => e.data)
        .toList();
    
    if (records.isEmpty) {
      snackbarKey.currentState!.showSnackBar(const SnackBar(content: Text("No records!")));
      return;
    }

    if (mounted) {
      await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Wrap(
            children: records.map((e) => ListTile(title: Text(DateFormat.yMMMMd().format(e.dateTime)),)).toList(),
          ),
        );
      },
    );
    }  
  }
}
