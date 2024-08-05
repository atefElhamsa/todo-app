import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {

  final ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.lexendDeca(
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
      bodySmall: GoogleFonts.lexendDeca(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.grey1,
        ),
      ),
      displayMedium: GoogleFonts.lexendDeca(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      displaySmall: GoogleFonts.lexendDeca(
        textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.black
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.black),
    ),
  );

  final ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.darkMode,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.lexendDeca(
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
      bodySmall: GoogleFonts.lexendDeca(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.white.withOpacity(0.9),
        ),
      ),
      displayMedium: GoogleFonts.lexendDeca(
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.white.withOpacity(0.9),
        ),
      ),
      displaySmall: GoogleFonts.lexendDeca(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.white
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.white),
    ),
  );

}
