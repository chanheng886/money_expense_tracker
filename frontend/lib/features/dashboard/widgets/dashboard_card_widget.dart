import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/dashboard/widgets/transaction_widget.dart';
import 'package:frontend/features/transaction/viewmodels/transaction_viewmodel.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

Widget dashBoardCard(double totalBalance, double income, double expense) {
  final controller = Get.find<TransactionViewmodel>();

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
                    Text(
                      'total_balance'.tr,
                      style: AppTheme.font(context, fontSize: 13),
                    ),
                    const SizedBox(width: 4),
                    Obx(
                      () => IconButton(
                        splashRadius: 20,
                        visualDensity: VisualDensity.compact,
                        onPressed: () => controller.toggleBalanceVisibility(),
                        icon: Icon(
                          controller.isBalanceHidden.value
                              ? RemixIcons.eye_off_fill
                              : RemixIcons.eye_fill,
                          size: 18,
                          color: isDark
                              ? AppColors.darkSecondaryText
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => Text(
                    controller.isBalanceHidden.value
                        ? "••••••••"
                        : "\$${totalBalance.toStringAsFixed(2)}",
                    style: AppTheme.font(
                      context,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing:
                          controller.isBalanceHidden.value ? 2.0 : null,
                    ),
                  ),
                ),
                Divider(
                  color: isDark ? AppColors.darkBorder : Colors.grey.shade300,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => transactionWidget(
                        title: 'income'.tr,
                        subTitle: controller.isBalanceHidden.value
                            ? "••••••"
                            : "\$${income.toStringAsFixed(2)}",
                        icon: FontAwesomeIcons.arrowDown,
                        iconColor: AppColors.income,
                        boxColor: AppColors.income.withValues(alpha: 0.15),
                      ),
                    ),
                    Obx(
                      () => transactionWidget(
                        title: 'expense'.tr,
                        subTitle: controller.isBalanceHidden.value
                            ? "••••••"
                            : "\$${expense.toStringAsFixed(2)}",
                        icon: FontAwesomeIcons.arrowUp,
                        iconColor: AppColors.expense,
                        boxColor: AppColors.expense.withValues(alpha: 0.15),
                      ),
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
