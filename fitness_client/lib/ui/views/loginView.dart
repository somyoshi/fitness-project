import 'package:fitness_client/core/viewmodels/usuarioViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? _buildIsloading()
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    _buildBackground(),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildLogo(),
                          _buildInformations(),
                          SizedBox(
                            height: 8,
                          ),
                          _buildMessage(),
                          SizedBox(
                            height: 10,
                          ),
                          _buildLoginForm(),
                          SizedBox(
                            height: 10,
                          ),
                          _buildDontHaveAccount()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildIsloading() {
    return Stack(
      children: <Widget>[
        _buildBackground(),
        Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Autenticando...',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        "assets/images/background.png",
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Image.asset(
        "assets/images/logo.png",
        height: 200,
        width: 200,
        alignment: Alignment.center,
      ),
    );
  }

  Widget _buildInformations() {
    return Container(
      width: 180,
      child: Text(
        "Educador Físico & Batedor de Carteira",
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: Colors.white54, letterSpacing: 0.6, fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildMessage() {
    return Text(
      "CRC: 19191832",
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          color: Colors.white70,
          letterSpacing: 1,
          fontSize: 17,
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 45),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              validator: (String value) {
                if (value.isEmpty || !value.contains('@'))
                  return "E-mail inválido!";
                else {
                  return null;
                }
              },
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.white70, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: _isObscureText,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              validator: (String text) {
                if (text.isEmpty) {
                  return "Senha não pode ser vazia!";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: "Senha",
                hintStyle: TextStyle(color: Colors.white70, fontSize: 15),
                suffixIcon: IconButton(
                    icon: Icon(
                      _isObscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscureText = !_isObscureText;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    _isLoading = true;
                  });
                  UsuarioViewModel().signIn(
                      email: _emailController.text,
                      password: _passwordController.text,
                      onSuccess: () {
                        setState(() {
                          _isLoading = false;
                        });
                      },
                      onFail: () => _onLoginFailed(context));
                } else {
                  Toast.show('Verifique suas credenciais!', context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "ENTRAR",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Colors.white, fontSize: 16, letterSpacing: 1)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDontHaveAccount() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        "Ainda não é aluno?",
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              decoration: TextDecoration.underline,
              letterSpacing: 0.5),
        ),
      ),
    );
  }

  void _onLoginFailed(context) {
    Toast.show('Usuário ou senha inválidos!', context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    setState(() {
      _isLoading = false;
    });
  }
}
