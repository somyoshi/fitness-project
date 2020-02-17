import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_client/core/models/exercicioModel.dart';
import 'package:fitness_client/core/providers/apiProvider.dart';

class ExercicioProvider {
  ApiProvider _apiProvider = ApiProvider('exercicios');

  Stream<List<ExercicioModel>> getExercicios() {
    StreamTransformer<QuerySnapshot, List<ExercicioModel>> _streamTransformer =
        StreamTransformer.fromHandlers(handleData: (data, sink) {
      return sink.add(
        data.documents
            .map(
              (snapshot) => ExercicioModel.map(snapshot.data,
                  documentID: snapshot.documentID),
            )
            .toList(),
      );
    });
    return _apiProvider.streamDataCollection().transform(_streamTransformer);
  }

  Stream<ExercicioModel> getExercicioByID(String exercicioID) {
    StreamTransformer<DocumentSnapshot, ExercicioModel> _streamTransformer =
        StreamTransformer.fromHandlers(handleData: (data, sink) {
      return sink.add(
        ExercicioModel.map(data.data, documentID: data.documentID),
      );
    });
    return _apiProvider
        .streamDataCollectionById(exercicioID)
        .transform(_streamTransformer);
  }

  void create(ExercicioModel exercicio) {
    _apiProvider.create(exercicio.toMap());
  }

  void update(ExercicioModel exercicio) {
    _apiProvider.update(exercicio.toMap(), exercicio.id);
  }

  void delete(ExercicioModel exercicio) {
    _apiProvider.delete(exercicio.id);
  }
}
