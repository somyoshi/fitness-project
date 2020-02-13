import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UsuarioProvider {
  FirebaseAuth _auth = FirebaseAuth.instance;

  void signIn({@required String email, @required String password, @required VoidCallback onSuccess, @required VoidCallback onFail}) async {
    _auth.signInWithEmailAndPassword(email: email, password: password).then((result){
      onSuccess();
    }).catchError((err){
      print(err);
      onFail();
    });
  }

  Stream<FirebaseUser> onStateChange() {
    return _auth.onAuthStateChanged;
  }

  void signOut() {
    _auth.signOut();
  }

  Future<String> getUid() async {
    return _auth.currentUser().then((user) => user.uid);
  }
}
