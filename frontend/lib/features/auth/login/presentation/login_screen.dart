import 'package:flutter/cupertino.dart';
import 'package:frontend/core/responsive/responsive_layout.dart';
import 'package:frontend/features/auth/login/ui/login_screen_desktop.dart';
import 'package:frontend/features/auth/login/ui/login_screen_mobile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreen: LoginScreenMobile(),
      desktopScreen: LoginScreenDesktop(),
    );
  }
}
