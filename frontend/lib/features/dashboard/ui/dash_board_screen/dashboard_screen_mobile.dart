import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/features/dashboard/presentation/all_transaction_screen.dart';
import 'package:frontend/features/dashboard/viewmodel/transaction_viewmodel.dart';
import 'package:frontend/features/dashboard/widgets/dashboard_card_widget.dart';
import 'package:frontend/features/dashboard/widgets/recent_transaction_card_widget.dart';
import 'package:frontend/features/transaction/presentation/transaction_screen.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class DashboardScreenMobile extends StatefulWidget {
  const DashboardScreenMobile({super.key});

  @override
  State<DashboardScreenMobile> createState() => _DashboardScreenMobileState();
}

class _DashboardScreenMobileState extends State<DashboardScreenMobile> {
  final TransactionViewmodel controller = Get.put(TransactionViewmodel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9FB),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(
              "https://i.pinimg.com/736x/7f/5c/bd/7f5cbd4c45a03f620cc1d60881ca20ed.jpg",
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good morning", style: GoogleFonts.dmSans(fontSize: 14)),
            Text(
              "Adam",
              style: GoogleFonts.dmSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.solidBell),
          ),
        ],
      ),
      body: Column(
        children: [
          //✅✅ Dash Board Card
          dashBoardCard(),
          //✅✅ Recent Transaction
          // Header
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Transactions",
                  style: GoogleFonts.dmSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => AllTransactionScreen());
                  },
                  child: Text(
                    "See all",
                    style: GoogleFonts.dmSans(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          //Body
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.transactions.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data = controller.transactions[index];
                  return recentTransactionWidget(
                    title: data.title,
                    subTitle: data.subTitle,
                    money: data.money,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
