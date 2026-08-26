import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? AppColors.darkCard : Colors.white;
    final borderColor = isDark ? AppColors.darkBorder : Colors.grey.shade200;
    final shadowColor = isDark ? Colors.black26 : Colors.grey.shade300;
    final hintColor = isDark ? AppColors.darkSecondaryText : Colors.grey.shade400;
    final labelColor = isDark ? AppColors.darkSecondaryText : Colors.grey;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Amount",
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.bold, color: labelColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.dollarSign, color: labelColor),
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: amountController,
                    style: GoogleFonts.dmSans(fontSize: 34, fontWeight: FontWeight.bold, color: labelColor),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '0.00',
                      hintStyle: GoogleFonts.dmSans(fontSize: 34, fontWeight: FontWeight.bold, color: hintColor),
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
                  color: cardColor,
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(color: AppColors.expense, borderRadius: BorderRadius.circular(10)),
                      child: const Center(child: FaIcon(FontAwesomeIcons.filter, color: Colors.white)),
                    ),
                    title: Text("Category", style: GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.bold, color: labelColor)),
                    subtitle: Text("Select Category", style: GoogleFonts.dmSans(fontSize: 16)),
                    trailing: IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.angleRight)),
                  ),
                ),
              ),
            ),
            _buildInputCard(titleController, "Title", "Add titles...", cardColor, borderColor, shadowColor, hintColor),
            _buildNoteCard(noteController, cardColor, borderColor, shadowColor, hintColor),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(color: AppColors.expense, borderRadius: BorderRadius.circular(15)),
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
                    style: GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputCard(TextEditingController ctrl, String label, String hint, Color cardColor, Color borderColor, Color shadowColor, Color hintColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: cardColor,
          border: Border.all(color: borderColor),
          boxShadow: [BoxShadow(color: shadowColor, blurRadius: 2, offset: const Offset(0, 2))],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: const EdgeInsets.only(top: 5), child: Text(label, style: GoogleFonts.dmSans(fontSize: 18))),
              TextField(
                controller: ctrl,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  hintText: hint,
                  hintStyle: GoogleFonts.dmSans(fontSize: 17, color: hintColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoteCard(TextEditingController ctrl, Color cardColor, Color borderColor, Color shadowColor, Color hintColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: cardColor,
          boxShadow: [BoxShadow(color: shadowColor, blurRadius: 2, offset: const Offset(0, 2))],
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Note", style: GoogleFonts.dmSans(fontSize: 18)),
              Expanded(
                child: TextField(
                  controller: ctrl,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Add notes...',
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.dmSans(fontSize: 16, color: hintColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
