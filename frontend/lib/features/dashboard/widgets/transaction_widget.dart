import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_theme.dart';

Widget transactionWidget({
  required String title,
  required String subTitle,
  required FaIconData icon,
  required Color iconColor,
  required Color boxColor,
}) {
  return Builder(
    builder: (context) {
      return Container(
        width: 145,
        height: 70,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FaIcon(icon, color: iconColor, size: 18),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.font(context, fontSize: 13),
                  ),
                  Text(
                    subTitle,
                    style: AppTheme.font(
                      context,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
