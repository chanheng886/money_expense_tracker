import 'package:flutter/cupertino.dart';
import 'package:frontend/core/responsive/responsive_layout.dart';
import 'package:frontend/features/settings/ui/settings_screen_desktop.dart';
import 'package:frontend/features/settings/ui/settings_screen_mobile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreen: SettingsScreenMobile(),
      desktopScreen: SettingsScreenDesktop(),
    );
  }
}
