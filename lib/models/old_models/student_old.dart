// import 'package:a_check/models/school.dart';
// import 'package:a_check/utils/localdb.dart';
// import 'package:flutter/foundation.dart';
// import 'package:hive/hive.dart';

// part 'student.g.dart';

// @HiveType(typeId: 3)
// class Person {
//   @HiveField(0)
//   String firstName;

//   @HiveField(1)
//   String middleName;

//   @HiveField(2)
//   String lastName;

//   @HiveField(3)
//   String? email;

//   @HiveField(4)
//   String? phone;

//   Person(
//       {required this.firstName,
//       required this.middleName,
//       required this.lastName,
//       this.email,
//       this.phone});

//   @override
//   String toString() {
//     if (middleName.isEmpty) return "$firstName $lastName";

//     return "$firstName ${middleName[0]}. $lastName";
//   }
// }

// @HiveType(typeId: 4)
// class Student extends Person with HiveObjectMixin {
//   @HiveField(5)
//   String id;

//   @HiveField(6)
//   Person? guardian;

//   @HiveField(7)
//   List? faceArray;

//   @HiveField(8)
//   Uint8List? facePhotoBytes;

//   Student(
//       {required this.id,
//       required firstName,
//       required middleName,
//       required lastName,
//       email,
//       phone,
//       this.guardian,
//       this.faceArray,
//       this.facePhotoBytes})
//       : super(
//             firstName: firstName,
//             middleName: middleName,
//             lastName: lastName,
//             email: email,
//             phone: phone);

//   @override
//   String get key => id;

//   Future<void> registerFace(List faceArray, Uint8List facePhotoBytes) {
//     this.faceArray = faceArray;
//     this.facePhotoBytes = facePhotoBytes;
//     return save();
//   }

//   Future<void> deleteFace() {
//     faceArray = null;
//     facePhotoBytes = null;
//     return save();
//   }

//   bool hasRegisteredFace() {
//     if (faceArray != null && faceArray!.isNotEmpty) {
//       return true;
//     }

//     return false;
//   }

//   Map<String, int> getPALEValues(String classKey) {
//     final attendances = HiveBoxes.attendancesBox()
//         .values
//         .cast<AttendanceRecord>()
//         .where((element) =>
//             element.classKey == classKey && element.studentId == id);

//     int present = 0, absent = 0, late = 0, excused = 0;
//     for (AttendanceRecord record in attendances) {
//       switch (record.status) {
//         case AttendanceStatus.present:
//           present++;
//           break;
//         case AttendanceStatus.absent:
//           absent++;
//           break;
//         case AttendanceStatus.late:
//           late++;
//           break;
//         case AttendanceStatus.excused:
//           excused++;
//           break;
//         default:
//           break;
//       }
//     }

//     return {
//       'present': present,
//       'absent': absent,
//       'late': late,
//       'excused': excused
//     };
//   }
// }

// class StudentValueNotifier extends ValueNotifier<Student> {
//   StudentValueNotifier(Student person) : super(person);
// }
