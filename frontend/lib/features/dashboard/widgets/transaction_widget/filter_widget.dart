import 'package:flutter/material.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/transaction/viewmodels/transaction_viewmodel.dart';
import 'package:get/get.dart';

class FilterWidget extends StatelessWidget {
  final TransactionViewmodel controller = Get.find<TransactionViewmodel>();
  FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final filters = [
      {'key': 'All', 'label': 'all'.tr},
      {'key': 'Expenses', 'label': 'expenses'.tr},
      {'key': 'Income', 'label': 'income'.tr},
    ];

    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filters.map((f) {
            final filterKey = f['key']!;
            final filterLabel = f['label']!;
            final isSelected = controller.selectedFilter.value == filterKey ||
                (filterKey == "Expenses" &&
                    controller.selectedFilter.value == "Expense");

            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ChoiceChip(
                label: Text(filterLabel),
                selected: isSelected,
                onSelected: (_) {
                  controller.setFilter(filterKey);
                },
                selectedColor:
                    isDark ? AppColors.darkCard : const Color(0xff1E293B),
                backgroundColor:
                    isDark ? AppColors.darkBackground : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: isSelected
                        ? (isDark ? AppColors.darkBorder : Colors.transparent)
                        : (isDark
                            ? AppColors.darkBorder
                            : Colors.grey.shade300),
                  ),
                ),
                showCheckmark: false,
                labelStyle: AppTheme.font(
                  context,
                  fontSize: 13,
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? (isDark ? AppColors.darkPrimaryText : Colors.white)
                      : (isDark
                          ? AppColors.darkSecondaryText
                          : Colors.black87),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
