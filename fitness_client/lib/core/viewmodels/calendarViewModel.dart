import 'package:table_calendar/table_calendar.dart';

class CalendarViewModel {
  CalendarController calendarController = CalendarController();
  List selectedEvents;
  //final DateTime _selectedDay = DateTime.now();

  Map<DateTime, List> offDays;

  Map<DateTime, List> trainingDays;

  CalendarViewModel() {
    this.selectedEvents = [];
    this.offDays = {
      DateTime(2020, 2, 16): ['New Year\'s Day'],
      DateTime(2020, 2, 17): ['Epiphany'],
      DateTime(2020, 2, 14): ['Valentine\'s Day'],
      DateTime(2020, 2, 21): ['Easter Sunday'],
      DateTime(2020, 2, 22): ['Easter Monday'],
    };
    this.trainingDays = {
      DateTime(2020, 2, 16): ['New Year\'s Day'],
      DateTime(2020, 2, 17): ['Epiphany'],
      DateTime(2020, 2, 23): ['Valentine\'s Day'],
      DateTime(2020, 2, 21): ['Easter Sunday'],
    };
  }
}
