import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final currentLocale = const Locale('en', 'US').obs;

  bool get isKhmer => currentLocale.value.languageCode == 'km';

  String get currentLanguageName => isKhmer ? 'ភាសាខ្មែរ' : 'English';

  void setLanguage(String languageCode) {
    if (languageCode == 'km') {
      currentLocale.value = const Locale('km', 'KH');
      Get.updateLocale(const Locale('km', 'KH'));
    } else {
      currentLocale.value = const Locale('en', 'US');
      Get.updateLocale(const Locale('en', 'US'));
    }
  }

  void toggleLanguage() {
    if (isKhmer) {
      setLanguage('en');
    } else {
      setLanguage('km');
    }
  }
}
