import 'package:fitness_client/core/models/profileModel.dart';
import 'package:fitness_client/core/viewmodels/dashboardViewModel.dart';
import 'package:fitness_client/core/viewmodels/usuarioViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardViewTab extends StatelessWidget with DashboardViewModel {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: <Widget>[
          StreamBuilder(
            stream: Provider.of<UsuarioViewModel>(context).getStreamProfile(),
            builder: (BuildContext context, AsyncSnapshot<Profile> profile) {
              if (profile.hasData) {
                return ListTile(
                    leading: Image.asset(
                      'assets/images/pessoa.png',
                    ),
                    trailing: Icon(Icons.info),
                    subtitle:
                        Text(profile.data.email, style: styleDashboardEmail),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Tenha um ótimo dia,',
                          style: styleDashboardSaudacao,
                        ),
                        Text(profile.data.nome, style: styleDashboardNome),
                      ],
                    ));
              } else {
                return Text(
                  'Carregando...',
                  style: TextStyle(color: Colors.white),
                );
              }
            },
          ),
          Container(
            padding: EdgeInsets.only(
              bottom: 12,
            ),
            height: 65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.grey),
            child: Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(4),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(4),
                  ),
                  color: Colors.white),
              height: 65,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemExtent: 80,
                children: <Widget>[
                  menuIconButton('notes', action: () => print('olaa')),
                  menuIconButton('calendar', action: () => print('olaa')),
                  menuIconButton('charts', action: () => print('olaa')),
                  menuIconButton('health', action: () => print('olaa')),
                  menuIconButton('chat', action: () => print('olaa')),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildBirthdayCard(context, 'Te desejo muita saúde e bons treinos!'),
          SizedBox(
            height: 10,
          ),
          buildComunCard(context, Colors.blueAccent),
        ],
      ),
    );
  }
}
