import 'package:hive_flutter/hive_flutter.dart';

part 'attendance_record.g.dart';

@HiveType(typeId: 5)
class AttendanceRecord extends HiveObject {
  @HiveField(0)
  String studentId;

  @HiveField(1)
  DateTime dateTime;

  @HiveField(2)
  bool isPresent;

  AttendanceRecord(
      {required this.studentId,
      required this.dateTime,
      required this.isPresent});
}
