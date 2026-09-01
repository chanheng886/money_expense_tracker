import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';

Widget recentTransactionWidget({
  FaIconData? icon,
  required String title,
  required String subTitle,
  required double money,
  String? type,
}) {
  final bool isExpense =
      (type != null && type.toLowerCase() == 'expense') || money < 0;
  final double absAmount = money.abs();
  final String formattedAmount = isExpense
      ? "-\$${absAmount.toStringAsFixed(2)}"
      : money == 0
          ? "\$${absAmount.toStringAsFixed(2)}"
          : "+\$${absAmount.toStringAsFixed(2)}";

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
              color: isDark
                  ? AppColors.darkBorder
                  : (isExpense
                      ? AppColors.expense.withValues(alpha: 0.12)
                      : AppColors.income.withValues(alpha: 0.12)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: FaIcon(
                icon ??
                    (isExpense
                        ? FontAwesomeIcons.arrowUp
                        : FontAwesomeIcons.arrowDown),
                color: isExpense ? AppColors.expense : AppColors.income,
                size: 20,
              ),
            ),
          ),
          title: Text(
            title,
            style: AppTheme.font(
              context,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            subTitle,
            style: AppTheme.font(context, fontSize: 13),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            formattedAmount,
            style: AppTheme.font(
              context,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isExpense ? AppColors.expense : AppColors.income,
            ),
          ),
        ),
      );
    },
  );
}
