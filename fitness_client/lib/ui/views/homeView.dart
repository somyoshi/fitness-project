import 'package:fitness_client/core/viewmodels/homeViewModel.dart';
import 'package:fitness_client/core/viewmodels/usuarioViewModel.dart';
import 'package:fitness_client/ui/views/tabs/dashboardViewTab.dart';
import 'package:fitness_client/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_client/ui/views/tabs/scoreViewTab.dart';
import 'package:fitness_client/ui/views/tabs/avaliacaoViewTab.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin, HomeViewModel, Globals {

      HomeViewModel _model = HomeViewModel();

  @override
  void initState() {
    super.initState();
    _model.tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    super.dispose();
    _model.tabController.dispose();
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
          controller: _model.tabController,
          tabs: <Widget>[
            _homeTab('assets/menu/home.png', 35),
            _homeTab('assets/menu/exercicio.png', 45),
            _homeTab('assets/menu/score.png', 45),
          ],
        ),
      ),
      body: Consumer<UsuarioViewModel>(
        builder: (context, model, child) {
          return TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _model.tabController,
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

  Tab _homeTab(String path, double height) {
    return Tab(
      icon: Image.asset(
        path,
        fit: BoxFit.fill,
        height: height,
      ),
    );
  }

}
