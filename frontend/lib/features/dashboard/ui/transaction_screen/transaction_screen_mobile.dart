import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/dashboard/widgets/recent_transaction_card_widget.dart';
import 'package:frontend/features/dashboard/widgets/transaction_widget/filter_widget.dart';
import 'package:frontend/features/transaction/viewmodels/transaction_viewmodel.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

class TransactionScreenMobile extends StatefulWidget {
  const TransactionScreenMobile({super.key});

  @override
  State<TransactionScreenMobile> createState() =>
      _TransactionScreenMobileState();
}

class _TransactionScreenMobileState extends State<TransactionScreenMobile> {
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: isDark ? AppColors.darkCard : Colors.white,
                child: IconButton(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        isDark ? AppColors.darkPrimaryText : Colors.black,
                    overlayColor: Colors.grey.withValues(alpha: 0.15),
                  ),
                  onPressed: () {
                    controller.clearSearch();
                    controller.setFilter("All");
                    Get.back();
                  },
                  icon: Icon(
                    RemixIcons.arrow_left_s_line,
                    size: 28,
                    color: isDark
                        ? AppColors.darkPrimaryText
                        : const Color(0xff1E293B),
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            'transactions'.tr,
            style: AppTheme.font(
              context,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.solidBell),
            ),
          ],
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //✅ Search Transaction
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Container(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Center(
                      child: TextField(
                        controller: searchController,
                        cursorColor: isDark
                            ? AppColors.darkPrimaryText
                            : const Color(0xff1E293B),
                        style: AppTheme.font(
                          context,
                          fontSize: 15,
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
                          suffixIconConstraints: const BoxConstraints(
                            minWidth: 32,
                            minHeight: 32,
                          ),
                          border: InputBorder.none,
                          hintText: 'search_hint'.tr,
                          hintStyle: AppTheme.font(
                            context,
                            fontSize: 14,
                            color: isDark
                                ? AppColors.darkSecondaryText
                                : Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //✅ Filter Expense and income and Filter All
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
                child: FilterWidget(),
              ),

              const SizedBox(height: 8),

              //✅ Transaction List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(() {
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
                        child: Column(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.receipt,
                              size: 44,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'no_transactions_yet'.tr,
                              style: AppTheme.font(
                                context,
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  final list = controller.filteredTransactions;

                  if (list.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40.0,
                          horizontal: 20,
                        ),
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
                            const SizedBox(height: 6),
                            Text(
                              controller.searchQuery.value.isNotEmpty
                                  ? "\"${controller.searchQuery.value}\""
                                  : 'no_matching_desc'.tr,
                              textAlign: TextAlign.center,
                              style: AppTheme.font(
                                context,
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 14),
                            TextButton.icon(
                              onPressed: () {
                                searchController.clear();
                                controller.clearSearch();
                                controller.setFilter("All");
                              },
                              icon: const Icon(Icons.refresh, size: 18),
                              label: Text(
                                'reset_filters'.tr,
                                style: AppTheme.font(
                                  context,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: list.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
