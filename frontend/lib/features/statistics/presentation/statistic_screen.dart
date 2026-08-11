import 'package:flutter/cupertino.dart';
import 'package:frontend/core/responsive/responsive_layout.dart';
import 'package:frontend/features/statistics/ui/statistic_screen_desktop.dart';
import 'package:frontend/features/statistics/ui/statistic_screen_mobile.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreen: StatisticScreenMobile(),
      desktopScreen: StatisticScreenDesktop(),
    );
  }
}
