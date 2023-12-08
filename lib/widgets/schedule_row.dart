import 'package:a_check/models/school.dart';
import 'package:flutter/material.dart';

class ScheduleRow extends StatelessWidget {
  const ScheduleRow(
      {Key? key,
      required this.schedule,
      required this.index,
      required this.onEdit,
      required this.onDelete})
      : super(key: key);

  final ClassSchedule schedule;
  final int index;
  final Function(int index) onEdit;
  final Function(int index) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: SizedBox(
        height: 42,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4)),
                  ),
                  child: Center(
                      child: Text(
                    schedule.weekdayName(),
                    style: const TextStyle(color: Colors.white),
                  ))),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                decoration: const BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(color: Colors.grey.withOpacity(0.5),
                  //   spreadRadius: 1,
                  //   blurRadius: 0,
                  //   offset: const Offset(3, 2),)
                  // ],
                  color: Colors.white30,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start: ${schedule.getStartTime().format(context)}",
                          style: const TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic,
                              fontSize: 13),
                        ),
                        Text(
                          "End: ${schedule.getEndTime().format(context)}",
                          style: const TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () => onEdit(index),
                            icon: Icon(
                              Icons.edit,
                              color: Colors.green.shade500,
                            )),
                        IconButton(
                            onPressed: () => onDelete(index),
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red.shade600,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
