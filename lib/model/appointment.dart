import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class  MeetingDataSource extends CalendarDataSource{




  MeetingDataSource(List<Appointment> source){
    appointments = source;
  }

}


List<Appointment> getAppointments(DateTime selectedDate){
  List<Appointment> meetings = <Appointment>[];
  //final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(selectedDate.year,selectedDate.month,selectedDate.day,11,0,0);
  final DateTime endTime = startTime.add( Duration(hours: 5));

  meetings.add(Appointment(
    startTime: startTime,
     endTime: endTime,
     subject: "conference",
     color: Colors.blue
     ));
  meetings.add(Appointment(
    startTime: startTime,
     endTime: endTime,
     subject: "conference2",
     color: Colors.blue
     ));
  meetings.add(Appointment(
    startTime: startTime,
     endTime: endTime,
     subject: "conference3",
     color: Colors.blue
     ));

     return meetings;
}