import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_client/core/models/profileModel.dart';
import 'package:fitness_client/core/providers/apiProvider.dart';

class ProfileProvider {
  ApiProvider _apiProvider = ApiProvider('profiles');
  Stream<ProfileModel> getProfile(String uid){
    StreamTransformer<DocumentSnapshot, ProfileModel> _streamTransformer =
        StreamTransformer.fromHandlers(handleData: (data, sink) {
      return sink.add(
        ProfileModel.map(data.data, documentID: data.documentID),
      );
    });
    return _apiProvider.streamDataCollectionById(uid).transform(_streamTransformer);
  }
}
