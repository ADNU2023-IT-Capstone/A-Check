import 'package:a_check/models/student.dart';
import 'package:a_check/pages/student_page.dart';
import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({Key? key, required this.student}) : super(key: key);

  final Student student;

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentPage(student: student)));
    }

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(student.toString()),
        ),
      ),
    );
  }
}
