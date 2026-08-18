import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StatisticScreenMobile extends StatefulWidget {
  const StatisticScreenMobile({super.key});
  @override
  State<StatisticScreenMobile> createState() => _StatisticScreenMobileState();
}

class _StatisticScreenMobileState extends State<StatisticScreenMobile> {
  DateTime? selectDate;
  List<Candle> get candles {
    return [
      Candle(
        date: DateTime(2024, 1, 2),
        high: 115,
        low: 101,
        open: 105,
        close: 108,
        volume: 1500,
      ),
      Candle(
        date: DateTime(2024, 1, 1),
        open: 100,
        high: 110,
        low: 95,
        close: 105,
        volume: 1200,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9FB),
      appBar: AppBar(
        backgroundColor: Color(0xffF7F9FB),
        title: Text(
          "Statistics",
          style: GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.bell)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Meony",
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Monthly spending overview",
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setState(() {
                        selectDate = picked;
                      });
                    }
                  },
                  child: Container(
                    width: 130,
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.calendar,
                              size: 14,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              selectDate == null
                                  ? DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(DateTime.now())
                                  : DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(selectDate!),
                              style: GoogleFonts.dmSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                        FaIcon(
                          FontAwesomeIcons.angleDown,
                          size: 11,
                          color: Colors.grey.shade500,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.wallet,
                          color: Color(0xff1E293B),
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Total Spent",
                          style: GoogleFonts.dmSans(
                            fontSize: 16,
                            color: Color(0xff1E293B),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "\$4,350.00",
                      style: GoogleFonts.dmSans(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1E293B),
                      ),
                    ),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.arrowTrendUp,
                          size: 16,
                          color: Color(0xffEF4444),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "+12% from last month",
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            color: Color(0xffEF4444),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // statistic chart graphic
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Expanded(
                child: SafeArea(
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(15),
                    child: Candlesticks(candles: candles),
                  ),
                ),
              ),
            ),
          ),
          // Top Categories
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.star,
                          size: 14,
                          color: Color(0xff1E293B),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Top Categories",
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            color: Color(0xff1E293B),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Housing",
                      style: GoogleFonts.dmSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1E293B),
                      ),
                    ),
                    Text(
                      "45% of total",
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
