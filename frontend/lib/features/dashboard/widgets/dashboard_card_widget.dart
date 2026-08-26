import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/features/dashboard/widgets/transaction_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

Widget dashBoardCard(double totalBalance, double income, double expense) {
  return Builder(
    builder: (context) {
      final isDark = Theme.of(context).brightness == Brightness.dark;

      return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: 210,
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkCard : Colors.white,
            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.black26 : Colors.grey.shade200,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
            border: Border.all(
              color: isDark ? AppColors.darkBorder : Colors.grey.shade100,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("TOTAL BALANCE", style: GoogleFonts.dmSans(fontSize: 14)),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(RemixIcons.eye_fill, size: 18),
                    ),
                  ],
                ),
                Text(
                  "\$${totalBalance.toStringAsFixed(2)}",
                  style: GoogleFonts.dmSans(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(color: isDark ? AppColors.darkBorder : Colors.grey.shade300),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    transactionWidget(
                      title: "Income",
                      subTitle: "\$${income.toStringAsFixed(2)}",
                      icon: FontAwesomeIcons.arrowDown,
                      iconColor: AppColors.income,
                      boxColor: AppColors.income.withValues(alpha: 0.15),
                    ),
                    transactionWidget(
                      title: "Expense",
                      subTitle: "\$${expense.toStringAsFixed(2)}",
                      icon: FontAwesomeIcons.arrowUp,
                      iconColor: AppColors.expense,
                      boxColor: AppColors.expense.withValues(alpha: 0.15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
