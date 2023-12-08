import 'package:a_check/models/school.dart';
import 'package:a_check/widgets/schedule_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScheduleDialogState extends State<ScheduleDialog> {
  int? selectedDay;
  TimeOfDay? startTime, endTime;

  void onDropdownChanged(int? value) => setState(() => selectedDay = value);

  void setStartTime() async {
    TimeOfDay? value = await showTimePicker(
        context: context,
        initialTime: startTime != null ? startTime! : TimeOfDay.now());

    setState(() => startTime = value);
  }

  void setEndTime() async {
    TimeOfDay? value = await showTimePicker(
        context: context,
        initialTime: endTime != null ? endTime! : TimeOfDay.now());

    setState(() => endTime = value);
  }

  void finalizeSchedule() {
    if (startTime == null || endTime == null || selectedDay == null) {
      Fluttertoast.showToast(msg: "There must be a set day and time!");
      return;
    }

    final schedule = ClassSchedule.usingTimeOfDay(
        weekday: selectedDay!, startTime: startTime!, endTime: endTime!);

    Navigator.pop(context, schedule);
  }

  @override
  void initState() {
    super.initState();

    if (widget.schedule != null) {
      selectedDay = widget.schedule!.weekday;
      startTime = widget.schedule!.getStartTime();
      endTime = widget.schedule!.getEndTime();
    }
  }

  @override
  Widget build(BuildContext context) => ScheduleDialogView(this);
}
