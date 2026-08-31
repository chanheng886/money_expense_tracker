import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

Widget recentTransactionWidget({
  FaIconData? icon,
  required String title,
  required String subTitle,
  required double money,
}) {
  return Builder(
    builder: (context) {
      final isDark = Theme.of(context).brightness == Brightness.dark;

      return Card(
        color: isDark ? AppColors.darkCard : Colors.white,
        child: ListTile(
          minTileHeight: 80,
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkBorder : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: FaIcon(
                icon,
                color: isDark
                    ? AppColors.darkPrimaryText
                    : const Color(0xff45474C),
              ),
            ),
          ),
          title: Text(
            title,
            style: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            subTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            money < 0
                ? "-$money"
                : money == 0
                ? "$money"
                : "+$money",
            style: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: money < 0 ? AppColors.expense : AppColors.income,
            ),
          ),
        ),
      );
    },
  );
}
