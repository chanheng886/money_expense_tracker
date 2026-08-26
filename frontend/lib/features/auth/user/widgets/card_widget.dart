import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

Widget cardWidget(
  String title,
  int? count,
  FaIconData icon,
  DateTime? date,
  String? subTitle,
) {
  final isDark = Get.context != null &&
      Theme.of(Get.context!).brightness == Brightness.dark;

  return Container(
    width: 104,
    height: 120,
    decoration: BoxDecoration(
      color: isDark ? AppColors.darkCard : Colors.white,
      border: Border.all(color: isDark ? AppColors.darkBorder : Colors.grey.shade200),
      boxShadow: [
        BoxShadow(
          color: isDark ? Colors.black26 : Colors.grey.shade300,
          blurRadius: 2,
          offset: const Offset(0, 2),
        ),
      ],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icon, color: isDark ? AppColors.darkIcon : const Color(0xff1E293B)),
          Text(
            title,
            style: GoogleFonts.dmSans(
              fontSize: 14,
              color: isDark ? AppColors.darkSecondaryText : const Color(0xff8590A6),
            ),
          ),
          if (subTitle != null)
            Text(
              subTitle,
              style: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.bold),
            )
          else if (date != null)
            Text(
              DateFormat('MM, yyyy').format(date),
              style: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.bold),
            )
          else
            Text(
              count.toString(),
              style: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    ),
  );
}
