import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_client/core/viewmodels/alunoViewModel.dart';
import 'package:fitness_client/core/viewmodels/usuarioViewModel.dart';
import 'package:fitness_client/locator.dart';
import 'package:fitness_client/ui/routers.dart';
import 'package:fitness_client/ui/views/homeView.dart';
import 'package:fitness_client/ui/views/loginView.dart';
import 'package:fitness_client/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(FitnessApp());
}

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<UsuarioViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<AlunoViewModel>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fitness Training App',
        theme: darkTheme,
        onGenerateRoute: Router.generateRoute,
        home: _homePage(),
      ),
    );
  }

  Widget _homePage() {
    return StreamBuilder(
      stream: UsuarioViewModel().onStateChange(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser>user) {
        if (user.hasData) {
          Provider.of<UsuarioViewModel>(context).user = user.data;
          return HomeView();
        } else {
          return LoginView();
        }
      },
    );
  }
}
