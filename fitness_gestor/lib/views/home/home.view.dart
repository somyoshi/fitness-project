import 'package:fitness_gestor/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:fitness_gestor/views/dashboard/dashboard.view.dart';
import 'package:fitness_gestor/views/aluno/aluno.view.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(       
        child: TabBar(
          controller: _controller,
          labelColor: principalColor,
          indicatorColor: principalColor,          
          unselectedLabelColor: Colors.black,
          tabs: <Widget>[
            Tab(
              icon: Icon(Ionicons.ios_home), text: 'Home',
            ),
            Tab(
              icon: Icon(Ionicons.ios_people), text: 'Alunos',
            ),
            Tab(
              icon: Icon(Ionicons.ios_help_circle_outline), text: 'Ajustes',
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: <Widget>[
          DashboardView(),
          AlunoView(),
          Container(),
        ],
      ),
    );
  }
}
