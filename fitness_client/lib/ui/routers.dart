import 'package:fitness_client/ui/views/calendarView.dart';
import 'package:fitness_client/ui/views/homeView.dart';
import 'package:fitness_client/ui/views/notFoundView.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/notFoundView':
        return MaterialPageRoute(builder: (_) => NotFoundView());
      case '/calendarView':
        return MaterialPageRoute(builder: (_) => CalendarView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
