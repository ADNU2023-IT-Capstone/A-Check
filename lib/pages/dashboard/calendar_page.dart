import 'package:a_check/pages/dashboard/controllers/calendar_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => CalendarState();
}

class CalendarView extends WidgetView<CalendarPage, CalendarState> {
  const CalendarView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WeekView(
        controller: state.calendarController,
        eventArranger: const SideEventArranger(),
      )),
    );
    // return Scaffold(
    //   body: Placeholder(),
    // );
  }
}
