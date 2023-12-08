import 'package:a_check/models/school.dart';
import 'package:a_check/pages/dashboard/calendar_page.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class CalendarState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) => CalendarView(this);

  @override
  void initState() {
    super.initState();

    calendarController = EventController();

    WidgetsBinding.instance.addPostFrameCallback((_) => setSchedule());
  }

  late final EventController calendarController;

  /// The [weekday] may be 0 for Sunday, 1 for Monday, etc. up to 7 for Sunday.
  DateTime mostRecentWeekday(DateTime date, int weekday) =>
      DateTime(date.year, date.month, date.day - (date.weekday - weekday) % 7);

  void setSchedule() async {
    if (!context.mounted) return;
    final classes = (await classesRef.get()).docs.map((e) => e.data).toList();

    for (SchoolClass c in classes) {
      for (ClassSchedule s in c.schedule) {
        final date = mostRecentWeekday(DateTime.now(), s.weekday);
        final startTime =
            date.copyWith(hour: s.startTimeHour, minute: s.startTimeMinute);
        final endTime =
            date.copyWith(hour: s.endTimeHour, minute: s.endTimeMinute);
        final event = CalendarEventData(
            title: c.subjectCode,
            description: "${c.name} ${c.section}",
            date: date,
            startTime: startTime,
            endTime: endTime);
        calendarController.add(event);
      }
    }
  }
}
