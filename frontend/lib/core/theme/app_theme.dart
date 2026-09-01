import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static TextStyle font(
    BuildContext? context, {
    bool? isKhmer,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? overflow,
    double? height,
    double? letterSpacing,
  }) {
    final khmer = isKhmer ?? (Get.locale?.languageCode == 'km');
    if (khmer) {
      return GoogleFonts.kantumruyPro(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
      );
    }
    return GoogleFonts.dmSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static ThemeData lightTheme({bool isKhmer = false}) => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightBackground,
          foregroundColor: AppColors.lightPrimaryText,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        cardColor: AppColors.lightCard,
        textTheme: (isKhmer
                ? GoogleFonts.kantumruyProTextTheme()
                : GoogleFonts.dmSansTextTheme())
            .apply(
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

  static ThemeData darkTheme({bool isKhmer = false}) => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkBackground,
          foregroundColor: AppColors.darkPrimaryText,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        cardColor: AppColors.darkCard,
        textTheme: (isKhmer
                ? GoogleFonts.kantumruyProTextTheme(ThemeData.dark().textTheme)
                : GoogleFonts.dmSansTextTheme(ThemeData.dark().textTheme))
            .apply(
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

  // Default getters
  static ThemeData get light =>
      lightTheme(isKhmer: Get.locale?.languageCode == 'km');
  static ThemeData get dark =>
      darkTheme(isKhmer: Get.locale?.languageCode == 'km');
}
