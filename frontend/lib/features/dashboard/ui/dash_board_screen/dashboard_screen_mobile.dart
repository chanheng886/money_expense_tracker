import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/dashboard/presentation/all_transaction_screen.dart';
import 'package:frontend/features/dashboard/widgets/dashboard_card_widget.dart';
import 'package:frontend/features/dashboard/widgets/recent_transaction_card_widget.dart';
import 'package:frontend/features/transaction/viewmodels/transaction_viewmodel.dart';
import 'package:get/get.dart';

class DashboardScreenMobile extends GetView<TransactionViewmodel> {
  const DashboardScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: const CachedNetworkImageProvider(
              "https://i.pinimg.com/736x/7f/5c/bd/7f5cbd4c45a03f620cc1d60881ca20ed.jpg",
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'good_morning'.tr,
              style: AppTheme.font(context, fontSize: 13),
            ),
            Text(
              "Adam",
              style: AppTheme.font(
                context,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.solidBell),
          ),
        ],
      ),
      body: Obx(() {
        double income = controller.transactions
            .where((t) => t.type == 'income')
            .fold(0.0, (sum, t) => sum + t.amount);

        double expense = controller.transactions
            .where((t) => t.type == 'expense')
            .fold(0.0, (sum, t) => sum + t.amount);

        double balance = income - expense;
        return Column(
          children: [
            //✅✅ Dash Board Card
            dashBoardCard(balance, income, expense),
            //✅✅ Recent Transaction
            // Header
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'recent_transactions'.tr,
                    style: AppTheme.font(
                      context,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const AllTransactionScreen());
                    },
                    child: Text(
                      'see_all'.tr,
                      style: AppTheme.font(
                        context,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Body
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.transactions.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'no_transactions'.tr,
                        style: AppTheme.font(context, fontSize: 15),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: controller.transactions.length.clamp(0, 4),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data = controller.transactions[index];
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
          ],
        );
      }),
    );
  }
}
