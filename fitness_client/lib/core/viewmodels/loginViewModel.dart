import 'package:flutter/material.dart';
import 'package:fitness_client/core/viewmodels/usuarioViewModel.dart';

class LoginViewModel {
  UsuarioViewModel _usuarioViewModel = UsuarioViewModel();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading;
  bool isObscureText;
  LoginViewModel() {
    this.isLoading = false;
    this.isObscureText = true;
  }

  void signIn(
      {@required String email,
      @required String password,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) {
    _usuarioViewModel.signIn(
        email: email,
        password: password,
        onSuccess: () => onSuccess(),
        onFail: () => onFail());
  }
}
