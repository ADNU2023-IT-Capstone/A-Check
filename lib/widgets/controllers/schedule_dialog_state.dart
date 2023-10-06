import 'package:a_check/models/class.dart';
import 'package:a_check/widgets/schedule_dialog.dart';
import 'package:flutter/material.dart';

class ScheduleDialogState extends State<ScheduleDialog> {
  DaysOfTheWeek? selectedDay;
  TimeOfDay? startTime, endTime;

  void onDropdownChanged(DaysOfTheWeek? value) =>
      setState(() => selectedDay = value);

  void setStartTime() async {
    TimeOfDay? value =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    setState(() => startTime = value);
  }

  void setEndTime() async {
    TimeOfDay? value =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    setState(() => endTime = value);
  }

  void finalizeSchedule() {
    final schedule = ClassSchedule.usingTimeOfDay(
        day: selectedDay!, startTime: startTime!, endTime: endTime!);

    Navigator.pop(context, schedule);
  }

  @override
  Widget build(BuildContext context) => ScheduleDialogView(this);
}
