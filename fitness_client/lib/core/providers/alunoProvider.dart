import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_client/core/models/alunoModel.dart';
import 'package:fitness_client/core/providers/apiProvider.dart';

class AlunoProvider {
  ApiProvider _apiProvider = ApiProvider('alunos');

  Stream<AlunoModel> getAlunoByCPF(String alunoCPF) {
    StreamTransformer<QuerySnapshot, AlunoModel> _streamTransformer =
        StreamTransformer.fromHandlers(handleData: (data, sink) {
      AlunoModel _aluno = AlunoModel.map(data.documents.first.data,
          documentID: data.documents.first.documentID);
      sink.add(_aluno);
      return sink;
    });
    return _apiProvider
        .streamDataCollectionWithWhere('cpf', alunoCPF)
        .transform(_streamTransformer);
  }

  void create(AlunoModel aluno) {
    _apiProvider.create(aluno.toMap());
  }

  void update(AlunoModel aluno) {
    _apiProvider.update(aluno.toMap(), aluno.id);
  }

  void delete(AlunoModel aluno) {
    _apiProvider.delete(aluno.id);
  }
}
