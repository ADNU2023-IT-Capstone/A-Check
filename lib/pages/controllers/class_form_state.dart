import 'package:a_check/models/class.dart';
import 'package:a_check/pages/class_form_page.dart';
import 'package:a_check/utils/localdb.dart';
import 'package:a_check/widgets/dialogs.dart';
import 'package:flutter/material.dart';

class ClassFormState extends State<ClassFormPage> {
  late TextEditingController? nameTedCon, codeTedCon, sectionTedCon;
  List<ClassSchedule> schedules = [];
  final formKey = GlobalKey<FormState>();

  void addSchedule() async {
    final result = await Dialogs.showScheduleDialog(context);

    if (result == null) return;
    setState(() {
      schedules.add(result);
    });
  }

  void editSchedule(int index) async {
    final result = await Dialogs.showScheduleDialog(context, schedule: schedules[index]);

    if (result == null) return;
    setState(() {
      schedules[index] = result;
    });
  }

  void deleteSchedule(int index) async {
    if (!await Dialogs.showConfirmDialog(context, const Text("Delete Schedule"), const Text("Are you sure?"))) return;
    
    setState(() {
      schedules.removeAt(index);
    });
  }

  void addClass() {
    if (!formKey.currentState!.validate()) return;
    if (schedules.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No schedules set!")));
      return;
    }

    final mClass = Class(
        code: codeTedCon!.text,
        name: nameTedCon!.text,
        section: sectionTedCon!.text,
        schedule: schedules);

    HiveBoxes.classesBox().put(mClass.key, mClass).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Added ${mClass.key}!")));
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
