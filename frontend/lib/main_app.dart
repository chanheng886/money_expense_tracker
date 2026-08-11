import 'package:flutter/material.dart';
import 'package:frontend/features/auth/user/presentation/profile_screen.dart';
import 'package:frontend/features/dashboard/presentation/dashboard_screen.dart';
import 'package:frontend/features/statistics/presentation/statistic_screen.dart';
import 'package:frontend/features/transaction/presentation/transaction_screen.dart';
import 'package:frontend/viewmodel/nav_controller.dart';
import 'package:frontend/widgets/custom_bottom_navbar_widget.dart';
import 'package:get/get.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final NavController controller = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      DashboardScreen(),
      StatisticScreen(),
      TransactionScreen(),
      ProfileScreen(),
    ];
    return Obx(
      () => Scaffold(
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: CustomBottomNavbarWidget(),
      ),
    );
  }
}
