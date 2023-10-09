import 'package:a_check/models/student.dart';
import 'package:a_check/pages/register_face_page.dart';
import 'package:a_check/pages/student_form_page.dart';
import 'package:a_check/pages/student_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:a_check/widgets/dialogs.dart';
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

  void registerFace() async {
    if (student.hasRegisteredFace()) {
      if (!await Dialogs.showConfirmDialog(
          context,
          const Text("Warning"),
          Text(
              "${student.firstName} already has a face registered. Continue?"))) {
        return;
      }
    }

    if (!context.mounted) return;
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RegisterFacePage(student: student)));

    if (result == true) {
      showSuccessSnackBar();
      setState(() {});
    } else if (result['result'] == false) {
      showFailedSnackBar(result['error']);
    }
  }

  void removeFromClass() async {
    if (!await Dialogs.showConfirmDialog(
        context,
        const Text("Warning"),
        Text(
            "${student.firstName} will be removed to class ${widget.studentClass!.code}. Continue?"))) {
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
