import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive_layout.dart';
import 'package:frontend/features/settings/ui/settings_screen_desktop.dart';
import 'package:frontend/features/settings/ui/settings_screen_mobile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScreen: SettingsScreenMobile(),
      desktopScreen: SettingsScreenDesktop(),
    );
  }
}
