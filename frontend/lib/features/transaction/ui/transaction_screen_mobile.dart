import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class TransactionScreenMobile extends StatefulWidget {
  const TransactionScreenMobile({super.key});

  @override
  State<TransactionScreenMobile> createState() =>
      _TransactionScreenMobileState();
}

class _TransactionScreenMobileState extends State<TransactionScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9FB),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  overlayColor: Colors.grey.withOpacity(0.15),
                ),
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  RemixIcons.arrow_left_s_line,
                  size: 28,
                  color: Color(0xff1E293B),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Transactions",
          style: GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.solidBell),
          ),
        ],
        backgroundColor: Color(0xffF7F9FB),
      ),
      body: Column(
        children: [
          //✅ Search Transaction
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Center(
                  child: TextField(
                    cursorColor: Color(0xff1E293B),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 14, left: 10),
                        child: FaIcon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 18,
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: 'Search transactions...',
                      hintStyle: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //✅ Filter Expense and income and Filter All
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "All",
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 30,
                  color: Colors.black,
                  child: Text(
                    'Expenses',
                    style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  child: Text(
                    'Income',
                    style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
