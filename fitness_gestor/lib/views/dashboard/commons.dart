import 'package:fitness_gestor/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget title(String title) {
  return Text(
    title,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,      
        letterSpacing: 2,
        color: principalColor,
      ),
    ),
  );
}
