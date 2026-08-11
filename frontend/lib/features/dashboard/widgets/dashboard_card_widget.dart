import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/features/dashboard/widgets/transaction_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

Widget dashBoardCard() {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
    child: Container(
      width: double.infinity,
      height: 210,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("TOTAL BALANCE", style: GoogleFonts.dmSans(fontSize: 14)),
                IconButton(
                  onPressed: () {},
                  icon: Icon(RemixIcons.eye_fill, size: 18),
                ),
              ],
            ),
            Text(
              "\$24,562.00",
              style: GoogleFonts.dmSans(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                transactionWidget(
                  title: "Income",
                  subTitle: "+5,2400.00",
                  icon: FontAwesomeIcons.arrowDown,
                  iconColor: Colors.green,
                  boxColor: Colors.green.shade100,
                ),
                transactionWidget(
                  title: "Expense",
                  subTitle: "-1,890.00",
                  icon: FontAwesomeIcons.arrowUp,
                  iconColor: Colors.red,
                  boxColor: Colors.red.shade100,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
