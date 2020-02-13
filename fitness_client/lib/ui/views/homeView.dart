import 'package:fitness_client/core/viewmodels/usuarioViewModel.dart';
import 'package:fitness_client/ui/views/tabs/dashboardViewTab.dart';
import 'package:fitness_client/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_client/ui/views/tabs/scoreViewTab.dart';
import 'package:fitness_client/ui/views/tabs/avaliacaoViewTab.dart';

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
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () => UsuarioViewModel().signOut(),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Fitness Training App",
          style: styleTitleApp,
        ),
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: <Widget>[
            Tab(
              icon: Image.asset(
                'assets/menu/home.png',
                fit: BoxFit.fill,
                height: 35,
              ),
            ),
            Tab(
              icon: Image.asset(
                'assets/menu/exercicio.png',
                fit: BoxFit.fill,
                height: 45,
              ),
            ),
            Tab(
              icon: Image.asset(
                'assets/menu/score.png',
                fit: BoxFit.fill,
                height: 45,
              ),
            ),
          ],
        ),
      ),
      body: Consumer<UsuarioViewModel>(
        builder: (context, model, child) {
          return TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: <Widget>[
              DashboardViewTab(),
              AvaliacaoViewTab(),
              ScoreViewTab(),
            ],
          );
        },
      ),
    );
  }

}
