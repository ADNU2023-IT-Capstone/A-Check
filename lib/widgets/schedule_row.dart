import 'package:a_check/models/class.dart';
import 'package:flutter/material.dart';

class ScheduleRow extends StatelessWidget {
  const ScheduleRow({Key? key, required this.schedule}) : super(key: key);

  final ClassSchedule schedule;

  // TODO: add edit functionality since minsan nabobobo tayo
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: SizedBox(
        height: 38,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                  child: Center(
                      child: Text(
                    schedule.day.toString(),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ))),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Start: ${schedule.getStartTime().format(context)}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    Text(
                      "End: ${schedule.getEndTime().format(context)}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
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
