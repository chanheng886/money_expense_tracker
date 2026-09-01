import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive_layout.dart';
import 'package:frontend/features/auth/user/ui/profile_screen_desktop.dart';
import 'package:frontend/features/auth/user/ui/profile_screen_mobile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScreen: ProfileScreenMobile(),
      desktopScreen: ProfileScreenDesktop(),
    );
  }
}
