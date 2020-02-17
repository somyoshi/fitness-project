import 'package:cloud_firestore/cloud_firestore.dart';

class AlunoModel {
  String id;
  String nome;
  String cpf;
  Timestamp dtNascimento;
  bool ativo;

  AlunoModel({this.id, this.nome, this.cpf, this.dtNascimento, this.ativo}) {
    this.id ??= '';
    this.nome ??= '';
    this.cpf ??= '';
    this.dtNascimento ??= Timestamp.now();
    this.ativo ??= true;
  }

  AlunoModel.map(dynamic obj, {String documentID}) {
    this.id = documentID;
    this.nome = obj['nome'];
    this.cpf = obj['cpf'];
    this.dtNascimento = obj['dtNascimento'];
    this.ativo = obj['ativo'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["nome"] = (this.nome ?? '').toUpperCase();
    map["cpf"] = this.cpf;
    map["dtNascimento"] = this.dtNascimento;
    map["ativo"] = this.ativo;
    return map;
  }
}
