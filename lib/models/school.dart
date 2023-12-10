// ignore_for_file: constant_identifier_names

import 'package:a_check/globals.dart';
import 'package:a_check/main.dart';
import 'package:a_check/models/person.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school.g.dart';

const firestoreSerializable = JsonSerializable(
    converters: firestoreJsonConverters,
    explicitToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true);

final schoolsRef = SchoolCollectionReference();
StudentCollectionReference get studentsRef => schoolRef.students;
SchoolClassCollectionReference get classesRef => schoolRef.classes;
TeacherCollectionReference get teachersRef => schoolRef.teachers;
AttendanceRecordCollectionReference get attendancesRef => schoolRef.attendances;

SchoolDocumentReference get schoolRef {
  final id = auth.currentUser!.schoolId;

  return schoolsRef.doc(id);
}

@Collection<School>('schools')
@Collection<SchoolClass>('schools/*/classes')
@Collection<Teacher>('schools/*/teachers')
@Collection<Student>('schools/*/students')
@Collection<AttendanceRecord>('schools/*/attendances')
@firestoreSerializable
class School {
  School({required this.id, required this.name, required this.officeName});

  final String name;
  final String officeName;

  factory School.fromJson(Map<String, Object?> json) => _$SchoolFromJson(json);

  @Id()
  final String id;

  SchoolDocumentReference get ref => schoolsRef.doc(id);

  static Future<Map<String, String>> get info async {
    final school = (await schoolRef.get()).data!;

    return {'school_name': school.name, 'office_name': school.officeName};
  }

  Map<String, Object?> toJson() => _$SchoolToJson(this);
}

@firestoreSerializable
class Student extends Person {
  Student(
      {required this.id,
      required super.firstName,
      required super.middleName,
      required super.lastName,
      super.email,
      super.phoneNumber,
      List<String>? guardianIds,
      List? faceArray,
      String? photoPath}) {
    this.guardianIds = guardianIds ?? List.empty();
    this.faceArray = faceArray ?? List.empty();
    this.photoPath = photoPath ?? "";
  }

  factory Student.fromJson(Map<String, Object?> json) =>
      _$StudentFromJson(json);

  @Id()
  final String id;

  late final String photoPath;
  late final List<String> guardianIds;
  late final List faceArray;

  @override
  Map<String, Object?> toJson() => _$StudentToJson(this);

  Future<String> getPhotoUrl() async {
    if (photoPath.isEmpty) return "";

    final url = await storage.ref().child(photoPath).getDownloadURL();
    return url;
  }

  Future<Map<String, int>> getPALEValues(String classId) async {
    final attendances = (await attendancesRef.get())
        .docs
        .map((e) => e.data)
        .where(
            (element) => element.classId == classId && element.studentId == id)
        .toList();

    int present = 0, absent = 0, late = 0, excused = 0;
    for (var record in attendances) {
      switch (record.status) {
        case AttendanceStatus.Present:
          present++;
          break;
        case AttendanceStatus.Absent:
          absent++;
          break;
        case AttendanceStatus.Late:
          late++;
          break;
        case AttendanceStatus.Excused:
          excused++;
          break;
        default:
          break;
      }
    }

    return {
      'present': present,
      'absent': absent,
      'late': late,
      'excused': excused
    };
  }
}

@firestoreSerializable
class Teacher extends Person {
  Teacher(
      {required this.id,
      required super.firstName,
      required super.middleName,
      required super.lastName,
      super.email,
      super.phoneNumber,
      required this.password,
      String? photoPath}) {
    this.photoPath = photoPath ?? "";
  }

  factory Teacher.fromJson(Map<String, Object?> json) =>
      _$TeacherFromJson(json);

  @Id()
  final String id;

  late final String password;
  late final String photoPath;

  @override
  Map<String, Object?> toJson() => _$TeacherToJson(this);

  bool authenticate(String password) {
    return this.password == password;
  }

  Future<String> getPhotoUrl() async {
    if (photoPath.isEmpty) return "";

    final url = await storage.ref().child(photoPath).getDownloadURL();
    return url;
  }

  Future<int> getTotalClasses() async {
    return (await classesRef.whereTeacherId(isEqualTo: id).get()).docs.length;
  }
}

@firestoreSerializable
class SchoolClass {
  SchoolClass(
      {required this.id,
      required this.subjectCode,
      required this.name,
      required this.section,
      required this.schedule,
      required this.teacherId,
      Set<String>? studentIds,
      int? maxAbsences}) {
    this.studentIds = studentIds ?? List.empty().toSet().cast();
    this.maxAbsences = maxAbsences ?? 3;
  }

  factory SchoolClass.fromJson(Map<String, Object?> json) =>
      _$SchoolClassFromJson(json);

  @Id()
  final String id;

  final String subjectCode;
  final String name;
  final String section;
  final List<ClassSchedule> schedule;
  final String teacherId;
  late final int maxAbsences;
  late final Set<String> studentIds;

  Map<String, Object?> toJson() => _$SchoolClassToJson(this);

  Future<Teacher> getTeacher() async {
    return (await teachersRef.doc(teacherId).get()).data!;
  }

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
    for (var i = 0; i < schedule.length; i++) {
      buffer.write(schedule[i].toString());

      if (i != schedule.length - 1) {
        buffer.writeln();
      }
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
      final date = DateTime(
          record.dateTime.year, record.dateTime.month, record.dateTime.day);
      if (!map.containsKey(date)) {
        map[date] = [];
      }

      map[date]!.add(record);
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

@firestoreSerializable
class AttendanceRecord {
  AttendanceRecord(
      {required this.id,
      required this.studentId,
      required this.classId,
      required this.dateTime,
      AttendanceStatus? status}) {
    this.status = status ?? AttendanceStatus.unknown;
  }

  factory AttendanceRecord.fromJson(Map<String, Object?> json) =>
      _$AttendanceRecordFromJson(json);

  @Id()
  final String id;

  final String studentId;
  final String classId;
  final DateTime dateTime;
  late AttendanceStatus status;

  Map<String, Object?> toJson() => _$AttendanceRecordToJson(this);

  Future<Student> getStudent() async {
    return (await studentsRef.doc(studentId).get()).data!;
  }
}

enum AttendanceStatus {
  @JsonValue(-1)
  unknown,
  @JsonValue(0)
  Absent,
  @JsonValue(1)
  Present,
  @JsonValue(2)
  Late,
  @JsonValue(3)
  Excused;
}
