import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/models/student.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'class.g.dart';

@HiveType(typeId: 1)
enum DaysOfTheWeek {
  @HiveField(0)
  sunday,
  @HiveField(1)
  monday,
  @HiveField(2)
  tuesday,
  @HiveField(3)
  wednesday,
  @HiveField(4)
  thursday,
  @HiveField(5)
  friday,
  @HiveField(6)
  saturday;

  @override
  String toString() {
    switch (this) {
      case monday:
        return "Monday";
      case tuesday:
        return "Tuesday";
      case wednesday:
        return "Wednesday";
      case thursday:
        return "Thursday";
      case friday:
        return "Friday";
      case saturday:
        return "Saturday";
      case sunday:
        return "Sunday";
      default:
        return "";
    }
  }

  String prefix() {
    switch (this) {
      case monday:
        return "M";
      case tuesday:
        return "T";
      case wednesday:
        return "W";
      case thursday:
        return "TH";
      case friday:
        return "F";
      case saturday:
        return "SAT";
      case sunday:
        return "SUN";
      default:
        return "";
    }
  }
}

@HiveType(typeId: 0)
class Class extends HiveObject {
  @HiveField(0)
  String code;

  @HiveField(1)
  String name;

  @HiveField(2)
  String section;

  @HiveField(3)
  List<ClassSchedule> schedule;

  @HiveField(4)
  Set<String> studentIds = {};

  Class(
      {required this.code,
      required this.name,
      required this.section,
      required this.schedule,
      List<String>? studentIds}) {
    if (studentIds != null) this.studentIds = studentIds.toSet();
  }

  Future<void> addStudents(Iterable<String> studentsIds) async {
    studentIds.addAll(studentsIds);
    await save();
  }

  @override
  // ignore: unnecessary_brace_in_string_interps
  String get key => "${code}_${section}";

  String getSchedule() {
    StringBuffer buffer = StringBuffer();
    for (ClassSchedule s in schedule) {
      buffer.writeln(s.toString());
    }

    return buffer.toString();
  }

  @override
  String toString() {
    String classInfo = "$code: $name [$section]\n";
    var classSchedBuf = StringBuffer();
    for (var s in schedule) {
      classSchedBuf.write(
          "${s.day} ${s.startTimeHour.toString().padLeft(2, '0')}:${s.startTimeMinute.toString().padLeft(2, '0')} - ${s.endTimeHour.toString().padLeft(2, '0')}:${s.endTimeMinute.toString().padLeft(2, '0')}\n");
    }

    return classInfo + classSchedBuf.toString();
  }

  List<Student> getStudents() {
    final studentsList = studentIds.map((id) {
      return HiveBoxes.studentsBox().get(id) as Student;
    }).toList();
    studentsList.sort(
      (a, b) =>
          a.firstName[0].toLowerCase().compareTo(b.firstName[0].toLowerCase()),
    );
    return studentsList;
  }

  Map<DateTime, List<AttendanceRecord>> getAttendanceRecords() {
    final castedBox =
        HiveBoxes.attendancesBox().values.cast<AttendanceRecord>();
    final list = castedBox.where((element) => element.classKey == key).toList();
    list.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    final Map<DateTime, List<AttendanceRecord>> map = {};
    for (var record in list) {
      if (!map.containsKey(record.dateTime)) {
        map[record.dateTime] = [];
      }

      map[record.dateTime]!.add(record);
    }

    return map;
  }
}

@HiveType(typeId: 2)
class ClassSchedule {
  @HiveField(1)
  DaysOfTheWeek day;

  @HiveField(2)
  late int startTimeHour;

  @HiveField(3)
  late int startTimeMinute;

  @HiveField(4)
  late int endTimeHour;

  @HiveField(5)
  late int endTimeMinute;

  ClassSchedule(
      {required this.day,
      required this.startTimeHour,
      required this.startTimeMinute,
      required this.endTimeHour,
      required this.endTimeMinute});

  ClassSchedule.usingTimeOfDay(
      {required this.day,
      required TimeOfDay startTime,
      required TimeOfDay endTime}) {
    startTimeHour = startTime.hour;
    startTimeMinute = startTime.minute;
    endTimeHour = endTime.hour;
    endTimeMinute = endTime.minute;
  }

  TimeOfDay getStartTime() {
    return TimeOfDay(hour: startTimeHour, minute: startTimeMinute);
  }

  TimeOfDay getEndTime() {
    return TimeOfDay(hour: endTimeHour, minute: endTimeMinute);
  }

  @override
  String toString() {
    final locale = DateFormat.jm();
    final now = DateTime.now();
    final startTime =
        DateTime(now.year, now.month, now.day, startTimeHour, startTimeMinute);
    final endTime =
        DateTime(now.year, now.month, now.day, endTimeHour, endTimeMinute);
    return "${day.prefix()} ${locale.format(startTime)} - ${locale.format(endTime)}";
  }
}

class ClassValueNotifier extends ValueNotifier<Class> {
  ClassValueNotifier(Class mClass) : super(mClass);
}
