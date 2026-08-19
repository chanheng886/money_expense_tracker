import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenMobile extends StatefulWidget {
  const SplashScreenMobile({super.key});

  @override
  State<SplashScreenMobile> createState() => _SplashScreenMobileState();
}

class _SplashScreenMobileState extends State<SplashScreenMobile> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed('/mainapp');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Money Expense Tracker',
          style: GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
