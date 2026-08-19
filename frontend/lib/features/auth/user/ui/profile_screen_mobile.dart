import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/features/auth/user/widgets/card_widget.dart';
import 'package:frontend/features/auth/user/widgets/setting_card_widget.dart';
import 'package:frontend/features/settings/presentation/settings_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreenMobile extends StatefulWidget {
  const ProfileScreenMobile({super.key});
  @override
  State<ProfileScreenMobile> createState() => _ProfileScreenMobileState();
}

class _ProfileScreenMobileState extends State<ProfileScreenMobile> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9FB),
      appBar: AppBar(
        backgroundColor: Color(0xffF7F9FB),
        title: Text(
          "Profile",
          style: GoogleFonts.dmSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff1E293B),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        "https://i.pinimg.com/736x/a3/5d/d1/a35dd198746a13c2d380c8460aa7fab2.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0xff1E293B),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.pen,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Chan",
            style: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xffECEEF0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Edit profile",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    color: Color(0xff1E293B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardWidget(
                  "Transaction",
                  124,
                  FontAwesomeIcons.receipt,
                  null,
                  null,
                ),
                SizedBox(width: 8),
                cardWidget(
                  "Top Category",
                  null,
                  FontAwesomeIcons.house,
                  null,
                  "Housing",
                ),
                SizedBox(width: 8),
                cardWidget(
                  "Calender",
                  null,
                  FontAwesomeIcons.calendar,
                  date,
                  null,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  settingCardWidget(
                    "Personal Information",
                    FontAwesomeIcons.user,
                    () => Get.to(
                      Scaffold(
                        body: SizedBox(
                          child: Center(child: Text("Personal Information!")),
                        ),
                      ),
                    ),
                  ),
                  settingCardWidget(
                    "Setting",
                    FontAwesomeIcons.gear,
                    () => Get.to(SettingsScreen()),
                  ),
                  settingCardWidget(
                    "Privacy & Security",
                    FontAwesomeIcons.unlockKeyhole,
                    () => SizedBox(),
                  ),
                  settingCardWidget(
                    "Help & Supports",
                    FontAwesomeIcons.circleQuestion,
                    () => SizedBox(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xffEF4444),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Log out",
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
