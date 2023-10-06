import 'package:a_check/models/class.dart';
import 'package:a_check/models/student.dart';
import 'package:hive/hive.dart';

class HiveBoxes {
  static const classes = "classes";
  static const students = "students";

  static Box classesBox() => Hive.box(classes);
  static Box studentsBox() => Hive.box(students);

  static initialize() async {
    initializeAdapters();

    await Hive.openBox(classes);
    await Hive.openBox(students);
  }

  static initializeAdapters() {
    Hive.registerAdapter(DaysOfTheWeekAdapter());
    Hive.registerAdapter(ClassAdapter());
    Hive.registerAdapter(ClassScheduleAdapter());
    Hive.registerAdapter(PersonAdapter());
    Hive.registerAdapter(StudentAdapter());
  }
}