import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:intl/intl.dart';

Widget cardWidget(
  BuildContext context, {
  required String title,
  int? count,
  required FaIconData icon,
  DateTime? date,
  String? subTitle,
  VoidCallback? onTap,
}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 104,
        height: 120,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : Colors.white,
          border: Border.all(
            color: isDark ? AppColors.darkBorder : Colors.grey.shade200,
          ),
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
              FaIcon(
                icon,
                color: isDark ? AppColors.darkIcon : const Color(0xff1E293B),
                size: 20,
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: AppTheme.font(
                  context,
                  fontSize: 12,
                  color: isDark
                      ? AppColors.darkSecondaryText
                      : const Color(0xff8590A6),
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              if (subTitle != null)
                Text(
                  subTitle,
                  style: AppTheme.font(
                    context,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              else if (date != null)
                Text(
                  DateFormat('MM, yyyy').format(date),
                  style: AppTheme.font(
                    context,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              else
                Text(
                  (count ?? 0).toString(),
                  style: AppTheme.font(
                    context,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
