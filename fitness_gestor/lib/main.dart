import 'package:fitness_gestor/routers.dart';
import 'package:fitness_gestor/utils/theme.dart';
import 'package:fitness_gestor/views/home/home.view.dart';
import 'package:flutter/material.dart';

void main() => runApp(Gestor());

class Gestor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Gestor',
      theme: lightTheme,
      home: HomeView(),
    );
  }
}

/* 
MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AlunoViewModel()),
      ],
      child: MaterialApp(
        onGenerateRoute: Router.generateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Gestor',
        theme: lightTheme,
        home: HomeView(),
      ),
    ); */
