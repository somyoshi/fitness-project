import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_client/core/models/alunoModel.dart';
import 'package:fitness_client/core/models/execucaoModel.dart';

class TreinoModel {
  String id;
  AlunoModel aluno;
  List<ExecucaoModel> execucoes;
  Timestamp emissao;
  Timestamp dtTreino;
  String obs;
  bool finalizado;


  TreinoModel({this.id, this.aluno, this.execucoes, this.emissao, this.dtTreino, this.obs, this.finalizado}) {
    this.id ??= '';
    this.aluno ??= AlunoModel();
    this.execucoes ??= [];
    this.emissao ??= Timestamp.now();
    this.dtTreino ??= Timestamp.now();
    this.obs ??='';
    this.finalizado ??= false;    
  }

  TreinoModel.map(dynamic obj, {String documentID}) {
    this.id = documentID;
    this.aluno = AlunoModel.map(obj['aluno']);
    for (ExecucaoModel execucao in obj['execucoes']) {
      this.execucoes.add(ExecucaoModel.map(execucao));
    }
    this.emissao = obj['emissao'];
    this.dtTreino = obj["dtTreino"];
    this.obs = obj["obs"];
    this.finalizado = obj["finalizado"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["aluno"] = this.aluno.toMap();
    List execucoes = [];
    for (ExecucaoModel execucao in this.execucoes) {
      execucoes.add(execucao.toMap());
    }
    map["execucoes"] = execucoes;
    map["emissao"] = this.emissao;
    map["dtTreino"] = this.dtTreino;
    map["obs"] = (this.obs ?? '').toUpperCase();
    map["finalizado"] = (this.finalizado ??false);
    return map;
  }
}
