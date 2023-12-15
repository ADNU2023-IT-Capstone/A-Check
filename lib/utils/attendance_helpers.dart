import 'package:a_check/main.dart';
import 'package:a_check/models/school.dart';
import 'package:a_check/utils/email_helpers.dart';
import 'package:flutter/material.dart';

class AttendanceHelpers {
  // static Future<void> recordAttendance(
  //     {required SchoolClass schoolClass,
  //     required List<Student> classStudents,
  //     required List<Student> recognizedStudents}) async {
  //   final now = DateTime.now();
  //   for (var student in classStudents) {
  //     late AttendanceRecord newRecord;
  //     AttendanceStatus status = recognizedStudents.contains(student)
  //         ? AttendanceStatus.Present
  //         : AttendanceStatus.Absent;

  //     try {
  //       // try to get an existing record
  //       // if there is one, skip this
  //       final record = (await attendancesRef
  //               .whereStudentId(isEqualTo: student.id)
  //               .whereDateTime(
  //                   isGreaterThan: DateUtils.dateOnly(now), isLessThan: now)
  //               .get())
  //           .docs
  //           .first
  //           .data;
  //       print('found record, skipping');
  //       continue;
  //     } on StateError {
  //       print('record not found, continuing');
  //       // do nothing if not found
  //     }

  //     String id = attendancesRef.doc().id;
  //     newRecord = AttendanceRecord(
  //         id: id,
  //         studentId: student.id,
  //         classId: schoolClass.id,
  //         dateTime: now,
  //         status: status);

  //     attendancesRef.doc(id).set(newRecord).then((value) async {
  //       if (newRecord.status != AttendanceStatus.Absent) {
  //         return;
  //       } else {
  //         await sendEmail(schoolClass: schoolClass, student: student);
  //       }
  //     });
  //   }

  //   return Future.value();
  // }

  static Future<void> sendEmail(
      {required SchoolClass schoolClass, required Student student}) async {
    // send email if auto email notify is on
    if (prefs.getBool('auto_email') ?? false) {
      final absences = (await attendancesRef
              .whereStudentId(isEqualTo: student.id)
              .whereClassId(isEqualTo: schoolClass.id)
              .get())
          .docs
          .length;
      final maxAbsences = schoolClass.maxAbsences;

      if (absences >= maxAbsences) {
        // check if this student has not been emailed
        if (!schoolClass.studentsAboveMaxAbsences.contains(student.id)) {
          final teacher = await schoolClass.getTeacher();
          await EmailHelpers.sendEmail(
              template: EmailTemplate.student,
              params: EmailTemplate.studentParams(
                  classCode: schoolClass.subjectCode,
                  classSection: schoolClass.section,
                  studentName: student.fullName,
                  studentEmail: student.email!,
                  teacherName: teacher.fullName,
                  teacherEmail: teacher.email!));

          if (student.guardian != null) {
            await EmailHelpers.sendEmail(
                template: EmailTemplate.guardian,
                params: EmailTemplate.guardianParams(
                    classCode: schoolClass.subjectCode,
                    classSection: schoolClass.section,
                    guardianName: student.guardian!.fullName,
                    guardianEmail: student.guardian!.email!,
                    studentName: student.fullName,
                    teacherName: teacher.fullName,
                    teacherEmail: teacher.email!));
          }

          final newList = schoolClass.studentsAboveMaxAbsences..add(student.id);
          await classesRef
              .doc(schoolClass.id)
              .update(studentsAboveMaxAbsences: newList);
        }
      }
    }
  }

  static Future<void> recordAttendance(
      {required List<AttendanceRecord> attendances}) async {
    final now = DateTime.now();
    for (var a in attendances) {
      final schoolClass = (await classesRef.doc(a.classId).get()).data!;
      final student = (await studentsRef.doc(a.studentId).get()).data!;

      try {
        // try to get an existing record
        // if there is one, skip this
        // ignore: unused_local_variable
        final record = (await attendancesRef
                .whereStudentId(isEqualTo: a.studentId)
                .whereDateTime(
                    isGreaterThan: DateUtils.dateOnly(now), isLessThan: now)
                .get())
            .docs
            .first
            .data;
        continue;
      } on StateError {
        // do nothing if not found
      }

      attendancesRef.doc(a.id).set(a).whenComplete(() async {
        if (a.status != AttendanceStatus.Absent) {
          return;
        } else {
          await sendEmail(schoolClass: schoolClass, student: student);
        }
      });
    }
  }
}
