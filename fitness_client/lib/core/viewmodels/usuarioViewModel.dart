import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_client/core/models/profileModel.dart';
import 'package:fitness_client/core/providers/profileProvider.dart';
import 'package:fitness_client/core/providers/usuarioProvider.dart';
import 'package:flutter/material.dart';

class UsuarioViewModel extends ChangeNotifier {
  Profile profile = Profile();
  UsuarioProvider _usuarioProvider = UsuarioProvider();
  FirebaseUser user;

  void signIn({@required String email, @required String password, @required VoidCallback onSuccess, @required VoidCallback onFail}){
    _usuarioProvider.signIn(email: email, password: password, onSuccess: () => onSuccess(), onFail: () => onFail());
  }

  Stream<FirebaseUser> onStateChange() {
    return _usuarioProvider.onStateChange();
  }

  void signOut() {
    _usuarioProvider.signOut();
  }

  Future<String> getUid() async {
    return await _usuarioProvider.getUid();
  }

  Stream<Profile> getStreamProfile(){
    return ProfileProvider().getStreamProfile(user.uid);
  } 
}
