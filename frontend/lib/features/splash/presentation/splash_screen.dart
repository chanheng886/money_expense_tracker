import 'package:flutter/cupertino.dart';
import 'package:frontend/core/responsive/responsive_layout.dart';
import 'package:frontend/features/splash/ui/splash_screen_desktop.dart';
import 'package:frontend/features/splash/ui/splash_screen_mobile.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreen: SplashScreenMobile(),
      desktopScreen: SplashScreenDesktop(),
    );
  }
}
