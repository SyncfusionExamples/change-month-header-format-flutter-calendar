import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(MontHeaderFormat());

class MontHeaderFormat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<MontHeaderFormat> {
  final CalendarController _controller = CalendarController();
  String _headerFormat = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
                child: SfCalendar(
                  view: CalendarView.day,
                  controller: _controller,
                  allowedViews: [
                    CalendarView.day,
                    CalendarView.week,
                    CalendarView.workWeek,
                    CalendarView.month,
                    CalendarView.timelineDay,
                    CalendarView.timelineWeek,
                    CalendarView.timelineWorkWeek,
                    CalendarView.timelineMonth,
                    CalendarView.schedule
                  ],
                  dataSource: _getCalendarDataSource(),
                  headerDateFormat: _headerFormat,
                  onViewChanged: viewChanged,
                ))));
  }

  void viewChanged(ViewChangedDetails viewChangedDetails) {
    if (_controller.view == CalendarView.day) {
      _headerFormat = 'yyy MMM';
    } else if (_controller.view == CalendarView.week ||
        _controller.view == CalendarView.workWeek ||
        _controller.view == CalendarView.timelineDay ||
        _controller.view == CalendarView.timelineMonth) {
      _headerFormat = 'MMM yyy';
    } else if (_controller.view == CalendarView.month) {
      _headerFormat = 'MMMM yy';
    } else if (_controller.view == CalendarView.timelineWeek ||
        _controller.view == CalendarView.timelineWorkWeek) {
      _headerFormat = 'MMM yy';
    } else {
      _headerFormat = 'yyy';
    }
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {

      });
    });
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(hours: 1)),
    endTime: DateTime.now().add(Duration(hours: 2)),
    subject: 'Planning',
    color: Colors.orangeAccent,
  ));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

