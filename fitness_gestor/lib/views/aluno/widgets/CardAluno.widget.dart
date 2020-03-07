import 'package:badges/badges.dart';
import 'package:fitness_gestor/models/aluno.model.dart';
import 'package:fitness_gestor/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CardAlunoWidget extends StatelessWidget {
  final AlunoModel _aluno;
  final int _indice;

  CardAlunoWidget(this._aluno, this._indice);
  @override
  Widget build(BuildContext context) {
    /* RandomColor _randomColor = RandomColor();
    Color _color = _randomColor.randomColor(
      colorHue: ColorHue.multiple(colorHues: [ColorHue.green, ColorHue.pink]),
    ); */
    return Badge(
      badgeColor: _aluno.ativo ? principalColor : Colors.black,
      shape: BadgeShape.square,
      borderRadius: 20,
      animationDuration: Duration(seconds: 2),
      animationType: BadgeAnimationType.slide,
      toAnimate: true,
      badgeContent: Text(
        _aluno.ativo ? 'Ativo' : 'Inativo',
        style: TextStyle(color: Colors.white),
      ),
      child: Container(
        padding: const EdgeInsets.only(
          left: 12,
        ),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: principalColor),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            trailing: Icon(
              Ionicons.ios_arrow_dropright_circle,
              color: principalColor,
            ),
            title: Text(
              _indice.toString() + ' - ' + _aluno.nome,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Desde: 01/03/2020',
              overflow: TextOverflow.ellipsis,
            ), /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    'Desde: 01/03/2020',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Chip(
                    backgroundColor: principalColor,
                    padding: EdgeInsets.all(0),
                    label: Text('Ativo', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ), */
          ),
        ),
      ),
    );
  }
}
