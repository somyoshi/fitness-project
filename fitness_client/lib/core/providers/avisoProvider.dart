import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_client/core/models/avisoModel.dart';
import 'package:fitness_client/core/providers/apiProvider.dart';

class AvisoProvider{
  ApiProvider _apiProvider = ApiProvider('avisos');

  Stream<List<AvisoModel>> getAvisos() {
    StreamTransformer<QuerySnapshot, List<AvisoModel>> _streamTransformer =
        StreamTransformer.fromHandlers(handleData: (data, sink) {
      return sink.add(
        data.documents
            .map(
              (snapshot) => AvisoModel.map(snapshot.data,
                  documentID: snapshot.documentID),
            )
            .toList(),
      );
    });
    return _apiProvider.streamDataCollection().transform(_streamTransformer);
  }

  void create(AvisoModel aviso) {
    _apiProvider.create(aviso.toMap());
  }

  void update(AvisoModel aviso) {
    _apiProvider.update(aviso.toMap(), aviso.id);
  }

  void delete(AvisoModel aviso) {
    _apiProvider.delete(aviso.id);
  }
}
