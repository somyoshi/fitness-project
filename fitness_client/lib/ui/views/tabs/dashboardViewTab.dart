import 'package:fitness_client/core/models/alunoModel.dart';
import 'package:fitness_client/core/models/avisoModel.dart';
import 'package:fitness_client/core/models/profileModel.dart';
import 'package:fitness_client/core/viewmodels/alunoViewModel.dart';
import 'package:fitness_client/core/viewmodels/dashboardViewModel.dart';
import 'package:fitness_client/core/viewmodels/usuarioViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DashboardViewTab extends StatelessWidget {
  final _model = DashboardViewModel();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Consumer<AlunoViewModel>(
        builder: (_, model, child) {
          return Column(
            children: <Widget>[
              StreamBuilder(
                stream:
                    Provider.of<UsuarioViewModel>(context).getStreamProfile(),
                builder: (BuildContext context,
                    AsyncSnapshot<ProfileModel> profile) {
                  if (profile.hasData) {
                    Provider.of<UsuarioViewModel>(context).profile =
                        profile.data;
                    return StreamBuilder(
                      stream: model.getAlunoByCPF(profile.data.cpf),
                      builder: (BuildContext context,
                          AsyncSnapshot<AlunoModel> aluno) {
                        if (aluno.hasData) {
                          if (aluno.data.ativo) {
                            model.aluno = aluno.data;
                            model.isAluno = aluno.data.ativo;
                            return _profileActiveTile(profile.data);
                          } else {
                            model.aluno = aluno.data;
                            model.isAluno = aluno.data.ativo;
                            return _profileInactiveTile(profile.data);
                          }
                        } else {
                          model.isAluno = false;
                          return _profileInactiveTile(profile.data);
                        }
                      },
                    );
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
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
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
                      _menuIconButton('notes.png',
                          action: () => model.isAluno
                              ? Navigator.pushNamed(context, '/noteView')
                              : _buildAlert(context)),
                      _menuIconButton('calendar.png',
                          action: () => model.isAluno
                              ? Navigator.pushNamed(context, '/calendarView')
                              : _buildAlert(context)),
                      _menuIconButton('charts.png',
                          action: () => model.isAluno
                              ? Navigator.pushNamed(context, '/chartsView')
                              : _buildAlert(context)),
                      _menuIconButton('health.png',
                          action: () => model.isAluno
                              ? Navigator.pushNamed(context, '/HealthView')
                              : _buildAlert(context)),
                      _menuIconButton('chat.png',
                          action: () => model.isAluno
                              ? Navigator.pushNamed(context, '/chatView')
                              : _buildAlert(context)),
                    ],
                  ),
                ),
              ),
              //buildBirthdayCard(context, ''),
              StreamBuilder(
                stream: _model.getAvisos(),
                builder: (BuildContext context, AsyncSnapshot<List<AvisoModel>> avisos){
                  if (avisos.hasData){
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: avisos.data.length,
                      itemBuilder: (BuildContext context, int i){
                        return _buildComunCard(context, Colors.blueAccent, avisos.data[i]);
                      },
                    );
                  }else{  
                    return Center(child: CircularProgressIndicator(),);
                  }
                },
              ),  
              SizedBox(
                height: 8,
              )
            ],
          );
        },
      ),
    );
  }

  Widget _profileActiveTile(ProfileModel profile) {
    return ListTile(
      leading: Image.network(profile.imagem),
      trailing: Icon(Icons.info),
      subtitle: Text(profile.email, style: _model.styleDashboardEmail),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Tenha um ótimo dia,',
            style: _model.styleDashboardSaudacao,
          ),
          Text(profile.nome, style: _model.styleDashboardNome),
        ],
      ),
    );
  }

  Widget _profileInactiveTile(ProfileModel profile) {
    return ListTile(
      subtitle: Center(
          child: Text('Percebemos que você ainda não é aluno!',
              style: _model.styleDashboardEmail)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Tenha um ótimo dia, Visitante',
            style: _model.styleDashboardSaudacao,
          ),
        ],
      ),
    );
  }

  Widget _menuIconButton(String iconName, {Function action}) {
    return IconButton(
      icon: Image.asset('assets/menu/' + iconName, fit: BoxFit.fill),
      onPressed: action,
    );
  }

  Widget _buildBirthDayCard(BuildContext context, AlunoViewModel model) {
    if (model.isAluno) {
      return _buildBirthdayCard(
          context, 'Te desejo muita saúde e bons treinos!');
    } else {
      return SizedBox();
    }
  }

  Widget _buildComunCard(
      BuildContext context, Color leftColor, AvisoModel aviso) {
    return Container(
      padding: EdgeInsets.only(
        left: 12,
      ),
      margin: EdgeInsets.only(top: 8),
      height: MediaQuery.of(context).size.height / 6,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: leftColor),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(4.0),
            bottomLeft: Radius.circular(4.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              aviso.titulo,
              style: _model.styleDashboardCards1,
              textAlign: TextAlign.center,
            ),
            Text(
              aviso.mensagem,
              style: _model.styleDashboardCards2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBirthdayCard(BuildContext context, String birthdayMessage) {
    return Container(
      padding: EdgeInsets.only(
        left: 12,
      ),
      margin: EdgeInsets.only(top: 8),
      height: MediaQuery.of(context).size.height / 4,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.green),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(4.0),
            bottomLeft: Radius.circular(4.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Feliz Aniversário!',
              style: _model.styleDashboardCards1,
              textAlign: TextAlign.center,
            ),
            Text(
              birthdayMessage,
              style: _model.styleDashboardCards2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _buildAlert(BuildContext context) {
    return Alert(
      context: context,
      type: AlertType.warning,
      title: "Oops, algo deu errado!",
      desc: 'Você ainda não é aluno!',
      buttons: [
        DialogButton(
          child: Text(
            "Fechar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        ),
      ],
    ).show();
  }
}
