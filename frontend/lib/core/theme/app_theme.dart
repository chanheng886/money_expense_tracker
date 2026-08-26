import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightBackground,
          foregroundColor: AppColors.lightPrimaryText,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        cardColor: AppColors.lightCard,
        textTheme: GoogleFonts.dmSansTextTheme().apply(
          bodyColor: AppColors.lightPrimaryText,
          displayColor: AppColors.lightPrimaryText,
        ),
        colorScheme: const ColorScheme.light(
          primary: AppColors.navy,
          secondary: AppColors.blue,
          surface: AppColors.lightCard,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: AppColors.lightPrimaryText,
        ),
      );

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkBackground,
          foregroundColor: AppColors.darkPrimaryText,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        cardColor: AppColors.darkCard,
        textTheme: GoogleFonts.dmSansTextTheme(
          ThemeData.dark().textTheme,
        ).apply(
          bodyColor: AppColors.darkPrimaryText,
          displayColor: AppColors.darkPrimaryText,
        ),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.blue,
          secondary: AppColors.blue,
          surface: AppColors.darkCard,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: AppColors.darkPrimaryText,
        ),
      );
}
