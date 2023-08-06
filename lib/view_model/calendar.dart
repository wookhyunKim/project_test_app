import 'package:flutter/material.dart';
import 'package:project_test_app/model/appointment.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: 350,
          height: 600,
          color: Colors.white,
          child: SfCalendar(
            view: CalendarView.month,
            monthViewSettings: MonthViewSettings(
              showAgenda: true,
              appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
            ),
            dataSource: MeetingDataSource(getAppointments(selectedDate)),
            onSelectionChanged: (calendarSelectionDetails) {
              setState(() {
                selectedDate = calendarSelectionDetails.date!;
              });
            },
          ),
        ),
        Positioned(
          right: 50,
          bottom: 130,
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              MeetingDataSource(getAppointments(selectedDate));
              setState(() {});
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  add(DateTime selectedDate) {
    MeetingDataSource(getAppointments(selectedDate));
    setState(() {});
  }
}
