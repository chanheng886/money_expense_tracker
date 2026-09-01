import 'package:flutter/material.dart';
import 'package:frontend/core/localization/app_translations.dart';
import 'package:frontend/core/localization/language_controller.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/core/theme/theme_controller.dart';
import 'package:frontend/features/auth/user/presentation/profile_screen.dart';
import 'package:frontend/features/dashboard/presentation/dashboard_screen.dart';
import 'package:frontend/features/splash/presentation/splash_screen.dart';
import 'package:frontend/features/statistics/presentation/statistic_screen.dart';
import 'package:frontend/features/transaction/binding/transaction_binding.dart';
import 'package:frontend/main_app.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    final languageController = Get.put(LanguageController());

    return Obx(
      () => GetMaterialApp(
        initialRoute: '/splash',
        translations: AppTranslations(),
        locale: languageController.currentLocale.value,
        fallbackLocale: const Locale('en', 'US'),
        theme: AppTheme.lightTheme(isKhmer: languageController.isKhmer),
        darkTheme: AppTheme.darkTheme(isKhmer: languageController.isKhmer),
        themeMode: themeController.themeMode.value,
        getPages: [
          GetPage(name: '/splash', page: () => const SplashScreen()),
          GetPage(
            name: '/mainapp',
            page: () => MainApp(),
            binding: TransactionBinding(),
          ),
          GetPage(name: '/dashboard', page: () => const DashboardScreen()),
          GetPage(name: '/statistic', page: () => const StatisticScreen()),
          GetPage(name: '/profile', page: () => const ProfileScreen()),
        ],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
