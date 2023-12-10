import 'package:a_check/models/school.dart';

class AttendanceHelpers {
  static Future<void> recordAttendance(
      {required String classId,
      required List<Student> classStudents,
      required List<Student> recognizedStudents}) async {
    final currentDateTime = DateTime.now();
    for (Student student in classStudents) {
      AttendanceRecord record;
      String id = attendancesRef.doc().id;

      if (recognizedStudents.contains(student)) {
        record = AttendanceRecord(
            id: id,
            studentId: student.id,
            classId: classId,
            dateTime: currentDateTime,
            status: AttendanceStatus.Present);
      } else {
        record = AttendanceRecord(
            id: id,
            studentId: student.id,
            classId: classId,
            dateTime: currentDateTime,
            status: AttendanceStatus.Absent);
      }

      await attendancesRef.doc(id).set(record);
    }
  }
}
