import 'package:fitness_client/core/models/exercicioModel.dart';
import 'package:fitness_client/core/providers/exercicioProvider.dart';
import 'package:fitness_client/core/viewmodels/calendarViewModel.dart';
import 'package:fitness_client/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarView extends StatefulWidget {
  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> with Globals {
  CalendarViewModel _model = CalendarViewModel();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _model.calendarController = CalendarController();
  }

  @override
  void dispose() {
    _model.calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          String link1 =
              'https://firebasestorage.googleapis.com/v0/b/fitness-desenvolvimento.appspot.com/o/exercicios%2F3.jpg?alt=media&token=4bd1ed2a-65ab-45ec-ab20-b3c470f8c379';
          List<String> imagens = [];
          imagens.add(link1);
          ExercicioProvider()
              .create(ExercicioModel(descricao: 'Flexão', imagens: imagens));
        },
      ),
      appBar: AppBar(
        title: Text(
          'Meu calendário',
          style: styleTitleApp,
        ),
      ),
      body: ListView(
        children: <Widget>[
          _buildTableCalendar(),
          _buildEventList(),
        ],
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      availableCalendarFormats: {
        CalendarFormat.month: 'Mês',
        CalendarFormat.twoWeeks: '2 Semanas',
        CalendarFormat.week: 'Semana'
      },
      locale: 'pt_BR',
      calendarController: _model.calendarController,
      holidays: _model.offDays,
      events: _model.trainingDays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.white),
        selectedColor: Colors.black,
        todayColor: Colors.white,
        todayStyle: TextStyle(color: Colors.black),
        holidayStyle: TextStyle(color: Colors.white),
      ),
      onDaySelected: _onDaySelected,
      daysOfWeekStyle:
          DaysOfWeekStyle(weekendStyle: TextStyle(color: Colors.white)),
      builders: (CalendarBuilders(
        markersBuilder: (BuildContext context, date, trainings, offs) {
          final children = <Widget>[];
          if (trainings.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildTrainingsMarker(date, trainings),
              ),
            );
          }
          if (offs.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -0.5,
                child: _buildOffDaysMarker(),
              ),
            );
          }
          return children;
        },
      )),
    );
  }

  Widget _buildEventList() {
    return ListView(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      children: _model.selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildTrainingsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _model.calendarController.isSelected(date)
            ? Colors.black
            : _model.calendarController.isToday(date)
                ? Colors.black
                : Colors.black,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildOffDaysMarker() {
    return Text(
      'OFF',
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    );
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _model.selectedEvents = events;
    });
  }
}
