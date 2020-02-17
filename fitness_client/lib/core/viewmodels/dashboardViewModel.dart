import 'package:fitness_client/core/models/avisoModel.dart';
import 'package:fitness_client/core/viewmodels/avisoViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardViewModel extends ChangeNotifier{  
  AvisoViewModel _avisoViewModel = AvisoViewModel();

  Stream<List<AvisoModel>> getAvisos(){
    return _avisoViewModel.getAvisos();
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
}
