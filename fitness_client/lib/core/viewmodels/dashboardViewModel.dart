import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardViewModel {



  Widget menuIconButton(String iconName, {Function action}) {
    return IconButton(
      icon: Image.asset('assets/menu/'+iconName, fit: BoxFit.fill),
      onPressed: action,
    );
  }

  final TextStyle styleDashboardSaudacao = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: Colors.white70,
      fontSize: 12,
    ),
  );

  final TextStyle styleDashboardNome = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: Colors.white70,
      fontSize: 18,
    ),
  );

  final TextStyle styleDashboardEmail = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),
  );

  final TextStyle styleDashboardCards1 = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: Colors.black,
      letterSpacing: 1,
      fontSize: 24,
    ),
  );

  final TextStyle styleDashboardCards2 = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: Colors.grey,
      letterSpacing: 1,
      fontSize: 20,
    ),
  );

  Widget buildBirthdayCard(BuildContext context, String birthdayMessage) {
    return Container(
      padding: EdgeInsets.only(
        left: 12,
      ),
      height: MediaQuery.of(context).size.height / 4,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.green),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(4.0),
            bottomLeft: Radius.circular(4.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Feliz Aniversário!',
              style: styleDashboardCards1,
              textAlign: TextAlign.center,
            ),
            Text(
              birthdayMessage,
              style: styleDashboardCards2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildComunCard(BuildContext context, Color leftColor) {
    return Container(
      padding: EdgeInsets.only(
        left: 12,
      ),
      height: MediaQuery.of(context).size.height / 4,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: leftColor),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(4.0),
            bottomLeft: Radius.circular(4.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Dicas do dia',
              style: styleDashboardCards1,
              textAlign: TextAlign.center,
            ),
            Text(
              'Lembre-se, maçã é diferente de manga',
              style: styleDashboardCards2,
              textAlign: TextAlign.center,
            ),
            Text(
              'Beba água!',
              style: styleDashboardCards2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
