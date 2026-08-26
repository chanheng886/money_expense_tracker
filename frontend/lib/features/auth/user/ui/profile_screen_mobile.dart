import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/features/auth/user/widgets/card_widget.dart';
import 'package:frontend/features/auth/user/widgets/setting_card_widget.dart';
import 'package:frontend/features/settings/presentation/settings_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreenMobile extends StatelessWidget {
  const ProfileScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
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
                      color: isDark ? AppColors.blue : const Color(0xff1E293B),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
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
          const SizedBox(height: 10),
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
              color: isDark ? AppColors.darkBorder : const Color(0xffECEEF0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Edit profile",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
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
                cardWidget("Transaction", 124, FontAwesomeIcons.receipt, null, null),
                const SizedBox(width: 8),
                cardWidget("Top Category", null, FontAwesomeIcons.house, null, "Housing"),
                const SizedBox(width: 8),
                cardWidget("Calender", null, FontAwesomeIcons.calendar, DateTime.now(), null),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCard : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: isDark ? Colors.black26 : Colors.grey.shade300,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  settingCardWidget("Personal Information", FontAwesomeIcons.user, () {
                    Get.to(Scaffold(
                      body: Center(child: Text("Personal Information!")),
                    ));
                  }),
                  settingCardWidget("Setting", FontAwesomeIcons.gear, () {
                    Get.to(SettingsScreen());
                  }),
                  settingCardWidget("Privacy & Security", FontAwesomeIcons.unlockKeyhole, () {}),
                  settingCardWidget("Help & Supports", FontAwesomeIcons.circleQuestion, () {}),
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
                color: AppColors.expense,
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
