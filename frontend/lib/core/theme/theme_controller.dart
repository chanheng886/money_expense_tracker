import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final themeMode = ThemeMode.light.obs;

  bool get isDark => themeMode.value == ThemeMode.dark;

  void toggleTheme() {
    themeMode.value =
        isDark ? ThemeMode.light : ThemeMode.dark;
  }
}
