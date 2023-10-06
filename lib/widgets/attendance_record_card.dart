import 'package:flutter/material.dart';

class AttendanceRecordCard extends StatelessWidget {
  const AttendanceRecordCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text("a record yeah"),
        ),
      ),
    );
  }
}
