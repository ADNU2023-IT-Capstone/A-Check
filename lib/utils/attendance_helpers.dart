import 'package:a_check/models/school.dart';

class AttendanceHelpers {
  static Future<void> recordAttendance(
      {required SchoolClass schoolClass,
      required List<Student> classStudents,
      required List<Student> recognizedStudents}) async {
    final currentDateTime = DateTime.now();
    final classSchedules = schoolClass.schedule;

    for (Student student in classStudents) {
      late AttendanceRecord newRecord;
      late AttendanceStatus status;
      String id = attendancesRef.doc().id;

      // check if student already has an attendance
      // if all schedules are skipped, it makes a new one
      for (var schedule in classSchedules) {
        print(schedule);
        // if schedule's weekday isn't today, then go to next schedule
        if (currentDateTime.weekday != schedule.weekday) {
          print('schedule weekday isn\'t today');
          continue;
        }

        // set status based on time; present, late, or absent
        status = recognizedStudents.contains(student)
            ? AttendanceStatus.statusByTime(schedule.getStartDateTime(),
                schedule.getEndDateTime(), currentDateTime)
            : AttendanceStatus.Absent;
        print(status);

        // get the record ranging from the class schedule
        final currentRecord = (await attendancesRef
                .whereStudentId(isEqualTo: student.id)
                .whereDateTime(
                    isGreaterThanOrEqualTo: schedule.getStartDateTime(),
                    isLessThanOrEqualTo: schedule.getEndDateTime())
                .get())
            .docs
            .map((e) => e.data)
            .firstOrNull;

        // if there is a record, set the ID to it instead
        // this will update that record instead of making a new record
        // once that's done, stop the loop; database should have only one record
        if (currentRecord != null) {
          print('found existing record, set id to it');

          // if student is recognized, set to present
          // else, set to absent
          id = currentRecord.id;
          break;
        }
      }

      newRecord = AttendanceRecord(
          id: id,
          studentId: student.id,
          classId: schoolClass.id,
          dateTime: currentDateTime,
          status: status);
      print(newRecord);
      
      await attendancesRef.doc(id).set(newRecord);
    }
  }
}
