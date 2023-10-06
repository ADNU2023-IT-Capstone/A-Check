import 'package:a_check/pages/register_face_page.dart';
import 'package:a_check/pages/student_page.dart';
import 'package:flutter/material.dart';

class StudentState extends State<StudentPage> {
  Future<bool> showConfirmDialog() async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Warning"),
              content: Text("${widget.student.firstName} already has a face registered. Continue?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text("Yes")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text("No")),
              ],
            ));
  }

  void showSuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Successfully registered ${widget.student.firstName}'s face!")));
  }

  void showFailedSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Something went wrong with saving ${widget.student.firstName}'s face...")));
  }

  void registerFace() async {
    if (widget.student.hasRegisteredFace()) {
      if (!await showConfirmDialog()) return;
    }

    if (!context.mounted) return;
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RegisterFacePage(student: widget.student)));

    if (result == true) {
      showSuccessSnackBar();
      setState(() {});
    } else if (result == false) {
      showFailedSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) => StudentView(this);
}
