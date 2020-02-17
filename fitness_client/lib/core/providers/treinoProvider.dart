import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_client/core/models/treinoModel.dart';
import 'package:fitness_client/core/providers/apiProvider.dart';

class TreinoProvider{
  ApiProvider _apiProvider = ApiProvider('treinos');

  Stream<List<TreinoModel>> getTreinos(String alunoCPF) {
    StreamTransformer<QuerySnapshot, List<TreinoModel>> _streamTransformer =
        StreamTransformer.fromHandlers(handleData: (data, sink) {
      return sink.add(
        data.documents
            .map(
              (snapshot) => TreinoModel.map(snapshot.data,
                  documentID: snapshot.documentID),
            )
            .toList(),
      );
    });
    return _apiProvider
        .streamDataCollectionWithWhere('aluno.cpf', alunoCPF)
        .transform(_streamTransformer);
  }

  void create(TreinoModel treino) {
    _apiProvider.create(treino.toMap());
  }

  void update(TreinoModel treino) {
    _apiProvider.update(treino.toMap(), treino.id);
  }

  void delete(TreinoModel treino) {
    _apiProvider.delete(treino.id);
  }
}
