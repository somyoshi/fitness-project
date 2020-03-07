import 'package:cloud_firestore/cloud_firestore.dart';

class AlunoModel {
  DocumentReference reference;
  String nome;
  String cpf;
  Timestamp dtNascimento;
  bool ativo;

  AlunoModel({this.reference, this.nome, this.cpf, this.dtNascimento, this.ativo}) {
    this.nome ??= '';
    this.cpf ??= '';
    this.dtNascimento ??= Timestamp.now();
    this.ativo ??= true;
  }

  AlunoModel.map(DocumentSnapshot doc) {
    this.reference = doc.reference;
    this.nome = doc['nome'];
    this.cpf = doc['cpf'];
    this.dtNascimento = doc['dtNascimento'];
    this.ativo = doc['ativo'];
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
