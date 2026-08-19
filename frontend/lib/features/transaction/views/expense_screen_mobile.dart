import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/features/transaction/models/transaction_model.dart';
import 'package:frontend/features/transaction/viewmodels/transaction_viewmodel.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ExpenseScreenMobile extends GetView<TransactionViewmodel> {
  ExpenseScreenMobile({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9FB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Amount",
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.dollarSign,
                  color: Colors.grey.shade500,
                ),
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: amountController,
                    style: GoogleFonts.dmSans(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '0.00',
                      hintStyle: GoogleFonts.dmSans(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                height: 80,
                child: Card(
                  color: Color(0xffF7F9FB),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: FaIcon(FontAwesomeIcons.filter)),
                    ),
                    title: Text(
                      "Category",
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    subtitle: Text(
                      "Select Category",
                      style: GoogleFonts.dmSans(fontSize: 16),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.angleRight),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Title",
                          style: GoogleFonts.dmSans(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        child: TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            hintText: "Add titles...",
                            hintStyle: GoogleFonts.dmSans(
                              fontSize: 17,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Note", style: GoogleFonts.dmSans(fontSize: 18)),
                      SizedBox(
                        height: 160,
                        child: TextField(
                          controller: noteController,
                          expands: true,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Add notes...',
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.dmSans(
                              fontSize: 16,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff10B981),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () async {
                    final transaction = TransactionModel(
                      amount: double.tryParse(amountController.text) ?? 0,
                      type: "expense",
                      title: titleController.text,
                      note: noteController.text,
                      date: DateFormat('dd, MM, yyyy').format(DateTime.now()),
                    );
                    await controller.addTransaction(transaction);
                  },
                  child: Text(
                    "Expense",
                    style: GoogleFonts.dmSans(
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
    );
  }
}
