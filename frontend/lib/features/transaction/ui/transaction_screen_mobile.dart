import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/features/transaction/views/expense_screen_mobile.dart';
import 'package:frontend/features/transaction/views/income_screen_mobile.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionScreenMobile extends StatefulWidget {
  const TransactionScreenMobile({super.key});

  @override
  State<TransactionScreenMobile> createState() =>
      _TransactionScreenMobileState();
}

class _TransactionScreenMobileState extends State<TransactionScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xffF7F9FB),
        appBar: AppBar(
          backgroundColor: Color(0xffF7F9FB),
          title: Text(
            "Add Transactions",
            style: GoogleFonts.dmSans(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.solidBell),
            ),
          ],
          // bottom:
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  labelStyle: GoogleFonts.dmSans(fontSize: 16),
                  unselectedLabelColor: Colors.black,
                  dividerHeight: 0,
                  indicator: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorColor: Colors.black,
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  tabs: [
                    SizedBox(width: 155, child: Tab(text: 'Expense')),
                    SizedBox(width: 155, child: Tab(text: 'Income')),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [ExpenseScreenMobile(), IncomeScreenMobile()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
