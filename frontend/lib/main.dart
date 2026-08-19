import 'package:flutter/cupertino.dart';
import 'package:frontend/features/auth/user/presentation/profile_screen.dart';
import 'package:frontend/features/dashboard/presentation/dashboard_screen.dart';
import 'package:frontend/features/splash/presentation/splash_screen.dart';
import 'package:frontend/features/statistics/presentation/statistic_screen.dart';
import 'package:frontend/features/transaction/binding/transaction_binding.dart';
import 'package:frontend/main_app.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splash',
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
    );
  }
}
