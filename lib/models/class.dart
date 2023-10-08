import 'package:a_check/models/attendance_record.dart';
import 'package:a_check/models/student.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'class.g.dart';

@HiveType(typeId: 1)
enum DaysOfTheWeek {
  @HiveField(0)
  monday,
  @HiveField(1)
  tuesday,
  @HiveField(2)
  wednesday,
  @HiveField(3)
  thursday,
  @HiveField(4)
  friday,
  @HiveField(5)
  saturday,
  @HiveField(6)
  sunday;

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
}

@HiveType(typeId: 0)
class Class extends HiveObject{
  @HiveField(0)
  late String _code;

  @HiveField(1)
  late String _name;

  @HiveField(2)
  late String _section;

  @HiveField(3)
  late List<ClassSchedule> _schedule;

  @HiveField(4)
  final Set<String> _studentIds = {};

  Class({required code, required name, required section, required schedule}) {
    _code = code;
    _name = name;
    _section = section;
    _schedule = schedule;
  }

  @override
  String get key => "$_code-$_section";
  String get code => _code;
  String get name => _name;
  String get section => _section;
  List<ClassSchedule> get schedule => _schedule;
  Set<String> get studentIds => _studentIds;

  set name(String name) {
    _name = name;
  }

  set schedule(List<ClassSchedule> schedule) {
    _schedule = schedule;
  }

  @override
  String toString() {
    String classInfo = "$code: $name [$section]\n";
    var classSchedBuf = StringBuffer();
    for (var s in _schedule) {
      classSchedBuf.write(
          "${s.day} ${s.startTimeHour.toString().padLeft(2, '0')}:${s.startTimeMinute.toString().padLeft(2, '0')} - ${s.endTimeHour.toString().padLeft(2, '0')}:${s.endTimeMinute.toString().padLeft(2, '0')}\n");
    }

    return classInfo + classSchedBuf.toString();
  }

  List<Student> getStudents() {
    final studentsList = _studentIds.map((id) {
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
}

class ClassValueNotifier extends ValueNotifier<Class> {
  ClassValueNotifier(Class mClass) : super(mClass);
}