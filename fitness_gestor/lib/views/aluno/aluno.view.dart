import 'package:fitness_gestor/controllers/aluno/aluno.controller.dart';
import 'package:fitness_gestor/models/aluno.model.dart';
import 'package:fitness_gestor/views/aluno/widgets/CardAluno.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AlunoView extends StatelessWidget {
  final AlunoController _alunoController = AlunoController();
  final TextEditingController _queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextField(
          controller: _queryController,
          onChanged: (String value) =>
              _alunoController.getAlunos('nome', value.toUpperCase()),
          decoration: InputDecoration(
              hintText: 'Pesquisar',
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Colors.transparent)),
              suffixIcon: Icon(Icons.search)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Ionicons.ios_cog,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () => print('teste de botao'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 72,
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  children: _buildOptionsBar(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Alunos cadastrados',
                style: TextStyle(fontSize: 22),
              ),
            ),
            Observer(
              builder: (_) {
                if (_alunoController.alunos.hasError) {
                  return Center(
                    child: RaisedButton(
                      onPressed: () => _alunoController.getAlunos("nome", ""),
                      child: Text('error'),
                    ),
                  );
                }
                if (_alunoController.alunos.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<AlunoModel> alunos = _alunoController.alunos.data;
                return ListView.separated(
                  separatorBuilder: (context, i) {
                    return SizedBox(
                      height: 8,
                    );
                  },
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: alunos.length,
                  itemBuilder: (context, i) {
                    return CardAlunoWidget(alunos[i], i + 1);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptionsBar() {
    List<Widget> x = [
      _buildListMenu(Ionicons.ios_apps, 'Todos', campo: 'nome', valor: ''),
      _buildListMenu(Ionicons.md_checkmark_circle_outline, 'Ativos',
          campo: 'ativo', valor: true),
      _buildListMenu(Ionicons.md_close_circle_outline, 'Inativos',
          campo: 'ativo', valor: false),
      _buildListMenu(Ionicons.md_person_add, 'Novo'),
    ];
    return x;
  }

  Widget _buildListMenu(IconData icon, String title,
      {String campo, dynamic valor}) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Icon(icon),
            Text(title),
          ],
        ),
      ),
      onTap: () {
        _queryController.text = '';
        if (title == 'Todos') {
          _alunoController.getAlunos(campo, valor);
        } else {
          _alunoController.getWithWhere(campo, valor);
        }
      },
    );
  }
}
