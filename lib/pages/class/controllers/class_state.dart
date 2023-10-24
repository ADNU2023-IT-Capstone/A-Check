import 'package:a_check/models/class.dart';
import 'package:a_check/pages/face_recognition_page.dart';
import 'package:a_check/pages/forms/class_form_page.dart';
import 'package:a_check/pages/class/class_page.dart';
import 'package:a_check/pages/forms/student_form_page.dart';
import 'package:a_check/pages/forms/students_form_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ClassState extends State<ClassPage> {
  late Class mClass;
  late ClassValueNotifier classValueNotifier;

  void backButtonPressed() {
    Navigator.pop(context);
  }

  void takeAttendance() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FaceRecognitionPage(mClass: mClass)));

    onClassValueChanged();
  }

  void addNewStudent() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StudentFormPage(
                  currentClass: mClass,
                )));
  }

  void addExistingStudent() async {
    final List<String>? result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const StudentsFormPage()));

    if (result == null || result.isEmpty) return;

    await mClass.addStudents(result);
  }

  void editClass() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClassFormPage(
            mClass: mClass,
          ),
        ));
  }

  void deleteClass() async {
    final result = await Dialogs.showConfirmDialog(
        context,
        const Text("Delete Class"),
        const Text(
            "This will delete the class and its related data. Continue?"));
    if (result == null || !result) {
      return;
    }

    if (context.mounted) {
      classValueNotifier.removeListener(onClassValueChanged);
      mClass.getAttendanceRecords().forEach((_, value) async {
        for (var record in value) {
          await record.delete();
        }
      });

      mClass.delete().then((_) {
        Navigator.pop(context);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    mClass = HiveBoxes.classesBox().get(widget.classKey);
    classValueNotifier = ClassValueNotifier(mClass);

    HiveBoxes.classesBox()
        .listenable(keys: [mClass.key]).addListener(onClassValueChanged);
  }

  void onClassValueChanged() {
    if (mounted) {
      setState(() {
        mClass = HiveBoxes.classesBox().get(widget.classKey);
        classValueNotifier.value = mClass;
      });
    }
  }

  @override
  void dispose() {
    classValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ClassView(this);
}
