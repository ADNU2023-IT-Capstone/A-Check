import 'package:hive_flutter/hive_flutter.dart';

part 'attendance_record.g.dart';

@HiveType(typeId: 5)
class AttendanceRecord extends HiveObject {
  @HiveField(0)
  String studentId;

  @HiveField(1)
  String classCode;

  @HiveField(2)
  DateTime dateTime;

  @HiveField(3)
  bool isPresent;

  AttendanceRecord(
      {required this.studentId,
      required this.classCode,
      required this.dateTime,
      required this.isPresent});
}
