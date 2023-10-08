import 'package:a_check/models/student.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'attendance_record.g.dart';

@HiveType(typeId: 5)
enum AttendanceStatus {
  @HiveField(0)
  present,
  @HiveField(1)
  absent,
  @HiveField(2)
  late,
  @HiveField(3)
  excused;

  @override
  String toString() {
    switch (this) {
      case present:
        return "Present";
      case absent:
        return "Absent";
      case late:
        return "Late";
      case excused:
        return "Excused";
      default:
        return "";
    }
  }
}

@HiveType(typeId: 6)
class AttendanceRecord extends HiveObject
    implements ValueListenable<AttendanceRecord> {
  @HiveField(0)
  String studentId;

  @HiveField(1)
  String classCode;

  @HiveField(2)
  DateTime dateTime;

  @HiveField(3)
  AttendanceStatus status;

  final _notifier = ValueNotifier<AttendanceRecord?>(null);

  AttendanceRecord(
      {required this.studentId,
      required this.classCode,
      required this.dateTime,
      required this.status}) {
    _notifier.value = this;
  }

  @override
  AttendanceRecord get value => this;

  set value(AttendanceRecord newRecord) {
    if (newRecord != this) {
      studentId = newRecord.studentId;
      classCode = newRecord.classCode;
      dateTime = newRecord.dateTime;
      status = newRecord.status;
      _notifier.value = this;
    }
  }

  Student get getStudent {
    return HiveBoxes.studentsBox().get(studentId) as Student;
  }

  late AttendanceStatus _previousStatus = status;
  set setStatus(AttendanceStatus newStatus) {
    if (newStatus != _previousStatus) {
      _previousStatus = status;
      status = newStatus;
      _notifier.value = this;
    }

    save();
  }

  @override
  void addListener(VoidCallback listener) {
    _notifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _notifier.removeListener(listener);
  }

  void notifyStatusChange() {
    if (_previousStatus != status) {
      _previousStatus = status;
      _notifier.value = this;
    }
  }

  void dispose() {
    _notifier.dispose();
  }
}
