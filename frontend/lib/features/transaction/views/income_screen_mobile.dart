import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/transaction/models/transaction_model.dart';
import 'package:frontend/features/transaction/viewmodels/transaction_viewmodel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class IncomeScreenMobile extends GetView<TransactionViewmodel> {
  IncomeScreenMobile({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? AppColors.darkCard : Colors.white;
    final borderColor = isDark ? AppColors.darkBorder : Colors.grey.shade200;
    final shadowColor = isDark ? Colors.black26 : Colors.grey.shade300;
    final hintColor =
        isDark ? AppColors.darkSecondaryText : Colors.grey.shade400;
    final labelColor = isDark ? AppColors.darkSecondaryText : Colors.grey;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                'amount'.tr,
                textAlign: TextAlign.center,
                style: AppTheme.font(
                  context,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: labelColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(
                    FontAwesomeIcons.dollarSign,
                    color: labelColor,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  IntrinsicWidth(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 100,
                        maxWidth: 240,
                      ),
                      child: TextField(
                        controller: amountController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        style: AppTheme.font(
                          context,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: labelColor,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 4),
                          hintText: '0.00',
                          hintStyle: AppTheme.font(
                            context,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: hintColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: borderColor),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.income,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.filter,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    title: Text(
                      'category'.tr,
                      style: AppTheme.font(
                        context,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: labelColor,
                      ),
                    ),
                    subtitle: Text(
                      'select_category'.tr,
                      style: AppTheme.font(context, fontSize: 14),
                    ),
                    trailing: const FaIcon(
                      FontAwesomeIcons.angleRight,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              _buildInputCard(
                context,
                titleController,
                'title'.tr,
                'add_title'.tr,
                cardColor,
                borderColor,
                shadowColor,
                hintColor,
              ),
              _buildNoteCard(
                context,
                noteController,
                cardColor,
                borderColor,
                shadowColor,
                hintColor,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.income,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      final transaction = TransactionModel(
                        amount: double.tryParse(amountController.text) ?? 0,
                        type: "income",
                        title: titleController.text,
                        note: noteController.text,
                        date: DateFormat('dd, MM, yyyy').format(DateTime.now()),
                      );
                      await controller.addTransaction(transaction);
                      amountController.clear();
                      titleController.clear();
                      noteController.clear();
                      Get.snackbar(
                        'success'.tr,
                        'income_added_success'.tr,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppColors.income.withValues(
                          alpha: 0.9,
                        ),
                        colorText: Colors.white,
                      );
                    },
                    child: Text(
                      'income_btn'.tr,
                      style: AppTheme.font(
                        context,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputCard(
    BuildContext context,
    TextEditingController ctrl,
    String label,
    String hint,
    Color cardColor,
    Color borderColor,
    Color shadowColor,
    Color hintColor,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: cardColor,
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTheme.font(
                context,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            TextField(
              controller: ctrl,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              style: AppTheme.font(context, fontSize: 16),
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.only(top: 6, bottom: 4),
                hintText: hint,
                hintStyle: AppTheme.font(context, fontSize: 16, color: hintColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteCard(
    BuildContext context,
    TextEditingController ctrl,
    Color cardColor,
    Color borderColor,
    Color shadowColor,
    Color hintColor,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: cardColor,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'note'.tr,
              style: AppTheme.font(
                context,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: TextField(
                controller: ctrl,
                expands: true,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: AppTheme.font(context, fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'add_notes'.tr,
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintStyle: AppTheme.font(
                    context,
                    fontSize: 16,
                    color: hintColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
