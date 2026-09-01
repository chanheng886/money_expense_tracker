import 'package:flutter/material.dart';

class SplashScreenDesktop extends StatefulWidget {
  const SplashScreenDesktop({super.key});

  @override
  State<SplashScreenDesktop> createState() => _SplashScreenDesktopState();
}

class _SplashScreenDesktopState extends State<SplashScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Splash Screen Desktop")),
    );
  }
}
