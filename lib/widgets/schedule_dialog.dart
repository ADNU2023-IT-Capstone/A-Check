import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/controllers/schedule_dialog_state.dart';
import 'package:a_check/models/class.dart';
import 'package:flutter/material.dart';

class ScheduleDialog extends StatefulWidget {
  const ScheduleDialog({Key? key}) : super(key: key);

  @override
  State<ScheduleDialog> createState() => ScheduleDialogState();
}

class ScheduleDialogView
    extends WidgetView<ScheduleDialog, ScheduleDialogState> {
  const ScheduleDialogView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<DaysOfTheWeek>> daysList = [
      DropdownMenuItem(
        value: DaysOfTheWeek.monday,
        child: Text(DaysOfTheWeek.monday.toString()),
      ),
      DropdownMenuItem(
          value: DaysOfTheWeek.tuesday,
          child: Text(DaysOfTheWeek.tuesday.toString())),
      DropdownMenuItem(
          value: DaysOfTheWeek.wednesday,
          child: Text(DaysOfTheWeek.wednesday.toString())),
      DropdownMenuItem(
          value: DaysOfTheWeek.thursday,
          child: Text(DaysOfTheWeek.thursday.toString())),
      DropdownMenuItem(
          value: DaysOfTheWeek.friday,
          child: Text(DaysOfTheWeek.friday.toString())),
      DropdownMenuItem(
          value: DaysOfTheWeek.saturday,
          child: Text(DaysOfTheWeek.saturday.toString())),
      DropdownMenuItem(
          value: DaysOfTheWeek.sunday,
          child: Text(DaysOfTheWeek.sunday.toString())),
    ];

    String getTime(TimeOfDay? time) {
      if (time != null) return time.format(context);
      return "...";
    }

    return AlertDialog(
      title: const Text("Add Schedule"),
      content: StatefulBuilder(builder: (context, setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Day"),
                    DropdownButton(
                        items: daysList,
                        value: state.selectedDay,
                        onChanged: state.onDropdownChanged),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text("Start Time"),
                    Text(getTime(state.startTime)),
                    ElevatedButton(
                        onPressed: state.setStartTime,
                        child: const Text("Set Start Time"))
                  ],
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    const Text("End Time"),
                    Text(getTime(state.endTime)),
                    ElevatedButton(
                        onPressed: state.setEndTime,
                        child: const Text("Set End Time"))
                  ],
                )
              ],
            )
          ],
        );
      }),
      actions: [
        ElevatedButton(
            onPressed: state.finalizeSchedule, child: const Text("Add")),
      ],
    );
  }
}
