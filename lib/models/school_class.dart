import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/models/person.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school_class.g.dart';

const firestoreSerializable = JsonSerializable(
    converters: firestoreJsonConverters,
    explicitToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true);

@Collection<SchoolClass>('classes')
@Collection<ClassSchedule>('classes/*/schedule')
@firestoreSerializable
class SchoolClass {
  SchoolClass(
      {required this.id,
      required this.subjectCode,
      required this.name,
      required this.section,
      required this.schedule,
      Set<String>? studentIds}) {
    this.studentIds = studentIds ?? List.empty().toSet().cast();
  }

  factory SchoolClass.fromJson(Map<String, Object?> json) =>
      _$SchoolClassFromJson(json);

  @Id()
  final String id;

  final String subjectCode;
  final String name;
  final String section;
  final List<ClassSchedule> schedule;
  late final Set<String> studentIds;

  Map<String, Object?> toJson() => _$SchoolClassToJson(this);

  @override
  String toString() {
    String classInfo = "$id: $name [$section]\n";
    var classSchedBuf = StringBuffer();
    for (var s in schedule) {
      classSchedBuf.write(
          "${s.weekdayName()} ${s.startTimeHour.toString().padLeft(2, '0')}:${s.startTimeMinute.toString().padLeft(2, '0')} - ${s.endTimeHour.toString().padLeft(2, '0')}:${s.endTimeMinute.toString().padLeft(2, '0')}\n");
    }

    return classInfo + classSchedBuf.toString();
  }

  Future<List<Student>> getStudents() async {
    List<Student> studentsList = [];
    for (var id in studentIds) {
      final student = (await studentsRef.doc(id).get()).data!;
      studentsList.add(student);
    }

    studentsList.sort(
      (a, b) =>
          a.firstName[0].toLowerCase().compareTo(b.firstName[0].toLowerCase()),
    );
    return studentsList;
  }

  String getSchedule() {
    StringBuffer buffer = StringBuffer();
    for (ClassSchedule s in schedule) {
      buffer.writeln(s.toString());
    }

    return buffer.toString();
  }

  Future<Map<DateTime, List<AttendanceRecord>>> getAttendanceRecords() async {
    final attendanceRecords = await attendancesRef
        .whereClassId(isEqualTo: id)
        .orderByDateTime()
        .get()
        .then((value) => value.docs.map((e) => e.data).toList());

    final Map<DateTime, List<AttendanceRecord>> map = {};
    for (var record in attendanceRecords) {
      if (!map.containsKey(record.dateTime)) {
        map[record.dateTime] = [];
      }

      map[record.dateTime]!.add(record);
    }

    return map;
  }
}

@firestoreSerializable
class ClassSchedule {
  ClassSchedule(
      {required this.weekday,
      required this.startTimeHour,
      required this.startTimeMinute,
      required this.endTimeHour,
      required this.endTimeMinute});

  ClassSchedule.usingTimeOfDay(
      {required this.weekday,
      required TimeOfDay startTime,
      required TimeOfDay endTime}) {
    startTimeHour = startTime.hour;
    startTimeMinute = startTime.minute;
    endTimeHour = endTime.hour;
    endTimeMinute = endTime.minute;
  }

  factory ClassSchedule.fromJson(Map<String, Object?> json) =>
      _$ClassScheduleFromJson(json);
  Map<String, Object?> toJson() => _$ClassScheduleToJson(this);

  int weekday;
  late int startTimeHour, startTimeMinute;
  late int endTimeHour, endTimeMinute;

  TimeOfDay getStartTime() {
    return TimeOfDay(hour: startTimeHour, minute: startTimeMinute);
  }

  TimeOfDay getEndTime() {
    return TimeOfDay(hour: endTimeHour, minute: endTimeMinute);
  }

  DateTime getStartDateTime() {
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, startTimeHour, startTimeMinute);
  }

  DateTime getEndDateTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, endTimeHour, endTimeMinute);
  }

  String weekdayName() {
    switch (weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "";
    }
  }

  @override
  String toString() {
    final locale = DateFormat.jm();
    final now = DateTime.now();
    final startTime =
        DateTime(now.year, now.month, now.day, startTimeHour, startTimeMinute);
    final endTime =
        DateTime(now.year, now.month, now.day, endTimeHour, endTimeMinute);
    return "${weekdayName().substring(0, 3)} ${locale.format(startTime)} - ${locale.format(endTime)}";
  }
}

final classesRef = SchoolClassCollectionReference();
