import 'package:a_check/utils/abstracts.dart';
import 'package:a_check/widgets/controllers/schedule_dialog_state.dart';
import 'package:a_check/models/school.dart';
import 'package:flutter/material.dart';

class ScheduleDialog extends StatefulWidget {
  const ScheduleDialog({Key? key, this.schedule}) : super(key: key);

  final ClassSchedule? schedule;

  @override
  State<ScheduleDialog> createState() => ScheduleDialogState();
}

class ScheduleDialogView
    extends WidgetView<ScheduleDialog, ScheduleDialogState> {
  const ScheduleDialogView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> daysList = const [
      DropdownMenuItem(
        value: DateTime.monday,
        child: Text("Monday"),
      ),
      DropdownMenuItem(
        value: DateTime.tuesday,
        child: Text("Tuesday"),
      ),
      DropdownMenuItem(
        value: DateTime.wednesday,
        child: Text("Wednesday"),
      ),
      DropdownMenuItem(value: DateTime.thursday, child: Text("Thursday")),
      DropdownMenuItem(value: DateTime.friday, child: Text("Friday")),
      DropdownMenuItem(value: DateTime.saturday, child: Text("Saturday")),
      DropdownMenuItem(value: DateTime.sunday, child: Text("Sunday")),
    ];

    String getTime(TimeOfDay? time) {
      if (time != null) return time.format(context);
      return "...";
    }

    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: const EdgeInsets.only(top: 10.0),
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
            child: Text(
                widget.schedule == null ? "Add Schedule" : "Edit Schedule"),
          ),
        ],
      ),

      // Text(widget.schedule == null ? "Add Schedule" : "Edit Schedule"),

      content: StatefulBuilder(builder: (context, setState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              color: Colors.grey,
              height: 6.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Day",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.00,
                          fontWeight: FontWeight.w500),
                    ),
                    const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 90, 0)),
                    DropdownButton(
                        style: const TextStyle(
                            color: Colors.black, fontSize: 14.00),
                        items: daysList,
                        value: state.selectedDay,
                        onChanged: state.onDropdownChanged),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    const Text(
                      "Start Time",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      getTime(state.startTime),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.00,
                      ),
                    ),
                    TextButton(
                      onPressed: state.setStartTime,
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Set Start Time",
                          style: TextStyle(color: Colors.green)),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                const SizedBox(width: 4),
                Column(
                  children: [
                    const Text(
                      "End Time",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      getTime(state.endTime),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.00,
                      ),
                    ),
                    TextButton(
                      onPressed: state.setEndTime,
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Set End Time",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: state.finalizeSchedule,
              child: Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                      bottomRight: Radius.circular(32.0)),
                ),
                child: Text(
                  widget.schedule == null ? "OK" : "EDIT",
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      }),
      // actions: [
      //   MaterialButton(
      //       onPressed: () => Navigator.pop(context),
      //       color: Colors.red[800],
      //       colorBrightness: Brightness.dark,
      //       child: const Text("Cancel")),
      //   MaterialButton(
      //       onPressed: state.finalizeSchedule,
      //       color: Colors.green[600],
      //       colorBrightness: Brightness.dark,
      //       child: Text(widget.schedule == null ? "Add" : "Edit",))
      // ],
    );
  }
}
