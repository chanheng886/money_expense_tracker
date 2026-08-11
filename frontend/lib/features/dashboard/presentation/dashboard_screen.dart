import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive_layout.dart';
import 'package:frontend/features/dashboard/ui/dashboard_screen_desktop.dart';
import 'package:frontend/features/dashboard/ui/dashboard_screen_mobile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreen: DashboardScreenMobile(),
      desktopScreen: DashboardScreenDesktop(),
    );
  }
}
