// import 'package:a_check/models/school.dart';
// import 'package:a_check/utils/localdb.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// part 'attendance_record.g.dart';

// @HiveType(typeId: 5)
// enum AttendanceStatus {
//   @HiveField(0)
//   present,
//   @HiveField(1)
//   absent,
//   @HiveField(2)
//   late,
//   @HiveField(3)
//   excused;

//   @override
//   String toString() {
//     switch (this) {
//       case present:
//         return "Present";
//       case absent:
//         return "Absent";
//       case late:
//         return "Late";
//       case excused:
//         return "Excused";
//       default:
//         return "";
//     }
//   }
// }

// @HiveType(typeId: 6)
// class AttendanceRecord extends HiveObject {
//   @HiveField(0)
//   String studentId;

//   @HiveField(1)
//   String classKey;

//   @HiveField(2)
//   DateTime dateTime;

//   @HiveField(3)
//   AttendanceStatus status;

//   AttendanceRecord(
//       {required this.studentId,
//       required this.classKey,
//       required this.dateTime,
//       required this.status});

//   Student get getStudent {
//     return HiveBoxes.studentsBox().get(studentId) as Student;
//   }
// }

// class AttendanceRecordValueNotifier extends ValueNotifier<AttendanceRecord> {
//   AttendanceRecordValueNotifier(AttendanceRecord record) : super(record);
// }