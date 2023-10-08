import 'package:a_check/models/class.dart';
import 'package:a_check/pages/class_form_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:a_check/widgets/schedule_dialog.dart';
import 'package:flutter/material.dart';

class ClassFormState extends State<ClassFormPage> {
  late TextEditingController nameTedCon, codeTedCon, sectionTedCon;
  List<ClassSchedule> schedules = [];

  void addSchedule() async {
    final result = await showDialog(
      context: context,
      builder: (context) => const ScheduleDialog(),
    );

    setState(() {
      schedules.add(result);
    });
  }

  void addClass() {
    final mClass = Class(
        code: codeTedCon.text,
        name: nameTedCon.text,
        section: sectionTedCon.text,
        schedule: schedules);

    HiveBoxes.classesBox().put(mClass.code, mClass).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Added ${mClass.code}!")));
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to add ${mClass.code}!\n${error.toString()}")));
    });
  }

  @override
  void initState() {
    super.initState();

    nameTedCon = TextEditingController();
    codeTedCon = TextEditingController();
    sectionTedCon = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => ClassFormView(this);
}
