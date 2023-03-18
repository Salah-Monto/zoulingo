import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoulingo/core/config/utils/colors.dart';

ThemeData getThemDataLight() => ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.primary,
      buttonTheme: const ButtonThemeData(
        buttonColor: Color.fromARGB(0xFF, 0x8A, 0xAA, 0xE5),
      ),
      cardTheme: const CardTheme(color: AppColors.primary),
      dividerColor: AppColors.secondPrimary,
      textTheme: TextTheme(
        headline1: GoogleFonts.cairo(
          fontSize: 72.0,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
        headline2: GoogleFonts.cairo(
          fontSize: 56.0,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
        headline3: GoogleFonts.cairo(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
        headline4: GoogleFonts.cairo(
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
        headline5: GoogleFonts.cairo(
          fontSize: 30.0,
          fontWeight: FontWeight.normal,
          color: AppColors.white,
        ),
        headline6: GoogleFonts.cairo(
          fontSize: 23.0,
          fontWeight: FontWeight.normal,
          color: AppColors.white,
        ),
        bodyText1: GoogleFonts.cairo(fontSize: 20, color: AppColors.white),
        bodyText2: GoogleFonts.cairo(fontSize: 18, color: AppColors.white),
        caption: const TextStyle(fontSize: 14.0, color: Colors.grey),
        button: const TextStyle(fontSize: 14.0, color: Colors.white),
      ),
    );
