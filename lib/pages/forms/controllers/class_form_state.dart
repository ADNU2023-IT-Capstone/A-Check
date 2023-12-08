import 'package:a_check/models/school.dart';
import 'package:a_check/pages/forms/class_form_page.dart';
import 'package:a_check/utils/dialogs.dart';
import 'package:flutter/material.dart';

class ClassFormState extends State<ClassFormPage> {
  late TextEditingController nameTedCon, codeTedCon, sectionTedCon;
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
    final result =
        await Dialogs.showScheduleDialog(context, schedule: schedules[index]);

    if (result == null) return;
    setState(() {
      schedules[index] = result;
    });
  }

  void deleteSchedule(int index) async {
    final result = await Dialogs.showConfirmDialog(
        context, const Text("Delete Schedule"), const Text("Are you sure?"));
    if (result == null || !result) return;

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

    final schoolClass = SchoolClass(
        id: "${codeTedCon.text}_${sectionTedCon.text}",
        subjectCode: codeTedCon.text,
        name: nameTedCon.text,
        section: sectionTedCon.text,
        schedule: schedules,
        studentIds: widget.schoolClass?.studentIds,
        teacherId: '');

    classesRef.doc(schoolClass.id).set(schoolClass).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "${widget.schoolClass == null ? "Added" : "Edited"} ${schoolClass.id}!")));
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();

    codeTedCon = TextEditingController();
    nameTedCon = TextEditingController();
    sectionTedCon = TextEditingController();

    if (widget.schoolClass != null) {
      codeTedCon.text = widget.schoolClass!.subjectCode;
      nameTedCon.text = widget.schoolClass!.name;
      sectionTedCon.text = widget.schoolClass!.section;
    }
  }

  @override
  Widget build(BuildContext context) => ClassFormView(this);
}
