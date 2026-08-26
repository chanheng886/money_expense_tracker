import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget settingCardWidget(
  String title,
  FaIconData leading,
  VoidCallback onPress,
) {
  final isDark = Get.context != null &&
      Theme.of(Get.context!).brightness == Brightness.dark;

  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: isDark ? AppColors.darkCard : Colors.white,
      border: Border(
        bottom: BorderSide(
          color: isDark ? AppColors.darkBorder : Colors.grey.shade300,
        ),
      ),
    ),
    child: ListTile(
      onTap: onPress,
      leading: FaIcon(
        leading,
        size: 16,
        color: isDark ? AppColors.darkIcon : const Color(0xff1E293B),
      ),
      title: Text(title, style: GoogleFonts.dmSans(fontSize: 16)),
      trailing: FaIcon(
        FontAwesomeIcons.angleRight,
        size: 16,
        color: isDark ? AppColors.darkSecondaryText : AppColors.lightSecondaryText,
      ),
    ),
  );
}
