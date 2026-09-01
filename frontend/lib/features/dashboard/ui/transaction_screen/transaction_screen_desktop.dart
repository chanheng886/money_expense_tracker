import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/dashboard/widgets/recent_transaction_card_widget.dart';
import 'package:frontend/features/dashboard/widgets/transaction_widget/filter_widget.dart';
import 'package:frontend/features/transaction/viewmodels/transaction_viewmodel.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

class TransactionScreenDesktop extends StatefulWidget {
  const TransactionScreenDesktop({super.key});

  @override
  State<TransactionScreenDesktop> createState() =>
      _TransactionScreenDesktopState();
}

class _TransactionScreenDesktopState extends State<TransactionScreenDesktop> {
  final TransactionViewmodel controller = Get.find<TransactionViewmodel>();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.text = controller.searchQuery.value;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            controller.clearSearch();
            controller.setFilter("All");
            Get.back();
          },
          icon: const Icon(RemixIcons.arrow_left_s_line, size: 28),
        ),
        title: Text(
          'all_transactions'.tr,
          style: AppTheme.font(
            context,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkCard : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: isDark
                          ? AppColors.darkBorder
                          : Colors.grey.shade200,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isDark
                            ? Colors.black26
                            : Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: searchController,
                    style: AppTheme.font(
                      context,
                      fontSize: 16,
                      color: isDark
                          ? AppColors.darkPrimaryText
                          : Colors.black87,
                    ),
                    onChanged: (value) => controller.search(value),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          RemixIcons.search_2_line,
                          size: 20,
                          color: isDark
                              ? AppColors.darkSecondaryText
                              : Colors.grey.shade500,
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 24,
                        minHeight: 24,
                      ),
                      suffixIcon: Obx(
                        () => controller.searchQuery.value.isNotEmpty
                            ? IconButton(
                                icon: Icon(
                                  RemixIcons.close_circle_fill,
                                  size: 20,
                                  color: isDark
                                      ? AppColors.darkSecondaryText
                                      : Colors.grey.shade400,
                                ),
                                onPressed: () {
                                  searchController.clear();
                                  controller.clearSearch();
                                },
                              )
                            : const SizedBox.shrink(),
                      ),
                      border: InputBorder.none,
                      hintText: 'search_hint'.tr,
                      hintStyle: AppTheme.font(
                        context,
                        fontSize: 15,
                        color: isDark
                            ? AppColors.darkSecondaryText
                            : Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FilterWidget(),
                const SizedBox(height: 16),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (controller.transactions.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Text(
                          'no_transactions_yet'.tr,
                          style: AppTheme.font(
                            context,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  }

                  final list = controller.filteredTransactions;

                  if (list.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        child: Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              size: 40,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(height: 14),
                            Text(
                              'no_matching_transactions'.tr,
                              style: AppTheme.font(
                                context,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton.icon(
                              onPressed: () {
                                searchController.clear();
                                controller.clearSearch();
                                controller.setFilter("All");
                              },
                              icon: const Icon(Icons.refresh, size: 18),
                              label: Text(
                                'reset_filters'.tr,
                                style: AppTheme.font(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = list[index];
                      return recentTransactionWidget(
                        title: data.title,
                        subTitle: data.note,
                        money: data.amount,
                        type: data.type,
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
