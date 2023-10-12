import 'package:a_check/pages/dashboard/controllers/calendar_state.dart';
import 'package:a_check/utils/abstracts.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => CalendarState();
}

class CustomEventArranger extends EventArranger {
  @override
  List<OrganizedCalendarEventData<Object?>> arrange({required List<CalendarEventData<Object?>> events, required double height, required double width, required double heightPerMinute}) {
    // TODO: implement arrange
    throw UnimplementedError();
  }
}

class CalendarView extends WidgetView<CalendarPage, CalendarState> {
  const CalendarView(state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: WeekView(
        eventArranger: SideEventArranger(),
      )),
    );
  }
}
