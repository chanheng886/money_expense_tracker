import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SettingsScreenMobile extends StatefulWidget {
  const SettingsScreenMobile({super.key});

  @override
  State<SettingsScreenMobile> createState() => _SettingsScreenMobileState();
}

class _SettingsScreenMobileState extends State<SettingsScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9FB),
      appBar: AppBar(
        backgroundColor: Color(0xffF7F9FB),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: FaIcon(FontAwesomeIcons.angleLeft),
        ),
      ),
      body: Column(children: [Center(child: Text("Setting Screen"))]),
    );
  }
}
