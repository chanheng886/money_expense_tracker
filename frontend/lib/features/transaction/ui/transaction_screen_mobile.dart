import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/features/transaction/views/expense_screen_mobile.dart';
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
        appBar: AppBar(
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
          bottom: TabBar(
            tabs: [
              Tab(text: 'Expense'),
              Tab(text: 'Income'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ExpenseScreenMobile(),
            Center(child: Text("Income")),
          ],
        ),
      ),
    );
  }
}
