import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/features/statistics/viewmodels/statistics_viewmodel.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StatisticScreenMobile extends GetView<StatisticsViewmodel> {
  const StatisticScreenMobile({super.key});

  static const _pieColors = [
    AppColors.income,
    AppColors.blue,
    AppColors.amber,
    AppColors.expense,
    AppColors.purple,
    AppColors.pink,
    AppColors.cyan,
    AppColors.lime,
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? AppColors.darkCard : Colors.white;
    final textColor = isDark ? AppColors.darkPrimaryText : AppColors.lightPrimaryText;
    final secondaryTextColor = isDark ? AppColors.darkSecondaryText : AppColors.lightSecondaryText;
    final borderColor = isDark ? AppColors.darkBorder : Colors.grey.shade200;
    final shadowColor = isDark ? Colors.black26 : Colors.grey.shade200;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Statistics",
          style: GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.bell)),
        ],
      ),
      body: Obx(() {
        final daily = controller.dailyExpenses;
        final categories = controller.categoryBreakdown;
        final hasData = daily.any((d) => d.amount > 0);

        return SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(context, isDark, cardColor, borderColor, shadowColor, textColor, secondaryTextColor),
              _buildSummaryCard(context, isDark, cardColor, borderColor, shadowColor, textColor),
              _buildBarChart(context, daily, hasData, isDark, cardColor, shadowColor, textColor, secondaryTextColor),
              _buildPieChart(context, categories, isDark, cardColor, shadowColor, textColor),
              const SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark, Color cardColor, Color borderColor, Color shadowColor, Color textColor, Color secondaryTextColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Money", style: GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
              Text("Monthly spending overview", style: GoogleFonts.dmSans(fontSize: 14, color: secondaryTextColor)),
            ],
          ),
          GestureDetector(
            onTap: _pickMonth,
            child: Container(
              width: 140,
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
                boxShadow: [BoxShadow(color: shadowColor, blurRadius: 6, offset: const Offset(0, 2))],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.calendar, size: 14, color: secondaryTextColor),
                      const SizedBox(width: 8),
                      Obx(
                        () => Text(
                          DateFormat('MMM yyyy').format(controller.selectedMonth.value),
                          style: GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w500, color: secondaryTextColor),
                        ),
                      ),
                    ],
                  ),
                  FaIcon(FontAwesomeIcons.angleDown, size: 11, color: secondaryTextColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, bool isDark, Color cardColor, Color borderColor, Color shadowColor, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: cardColor,
          border: Border.all(color: borderColor),
          boxShadow: [BoxShadow(color: shadowColor, offset: const Offset(0, 2), blurRadius: 2)],
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
                  FaIcon(FontAwesomeIcons.wallet, color: textColor, size: 16),
                  const SizedBox(width: 5),
                  Text("Total Spent", style: GoogleFonts.dmSans(fontSize: 16, color: textColor)),
                ],
              ),
              Obx(
                () => Text(
                  "\$${controller.totalExpense.value.toStringAsFixed(2)}",
                  style: GoogleFonts.dmSans(fontSize: 34, fontWeight: FontWeight.bold, color: textColor),
                ),
              ),
              Obx(() {
                final income = controller.totalIncome.value;
                final expense = controller.totalExpense.value;
                final pct = income > 0 ? ((income - expense) / income * 100) : 0.0;
                final isPositive = pct >= 0;
                return Row(
                  children: [
                    FaIcon(
                      isPositive ? FontAwesomeIcons.arrowTrendUp : FontAwesomeIcons.arrowTrendDown,
                      size: 16,
                      color: isPositive ? AppColors.income : AppColors.expense,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "${isPositive ? '+' : ''}${pct.toStringAsFixed(0)}% from income",
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: isPositive ? AppColors.income : AppColors.expense,
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBarChart(BuildContext context, List dailyExpenses, bool hasData, bool isDark, Color cardColor, Color shadowColor, Color textColor, Color secondaryTextColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: shadowColor, offset: const Offset(0, 2), blurRadius: 2)],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, right: 15, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Daily Expenses",
                  style: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: hasData
                    ? _barChart(dailyExpenses, isDark, secondaryTextColor)
                    : Center(child: Text("No expenses this month", style: GoogleFonts.dmSans(color: secondaryTextColor))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _barChart(List dailyExpenses, bool isDark, Color labelColor) {
    final maxY = dailyExpenses.map((d) => d.amount).fold<double>(0, (a, b) => a > b ? a : b);

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY > 0 ? maxY * 1.2 : 100,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                "\$${rod.toY.toStringAsFixed(0)}",
                GoogleFonts.dmSans(color: Colors.white, fontSize: 12),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: dailyExpenses.length > 10 ? 5 : 1,
              getTitlesWidget: (value, meta) {
                final day = value.toInt();
                if (dailyExpenses.length > 10 && day % 5 != 0 && day != 1) return const SizedBox.shrink();
                return SideTitleWidget(
                  meta: meta,
                  child: Text('$day', style: GoogleFonts.dmSans(fontSize: 10, color: labelColor)),
                );
              },
            ),
          ),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
        barGroups: dailyExpenses.asMap().entries.map((entry) {
          final d = entry.value;
          final isToday = d.day == DateTime.now().day;
          return BarChartGroupData(
            x: d.day,
            barRods: [
              BarChartRodData(
                toY: d.amount,
                color: isToday ? AppColors.income : AppColors.blue,
                width: dailyExpenses.length > 15 ? 6 : 10,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPieChart(BuildContext context, List categories, bool isDark, Color cardColor, Color shadowColor, Color textColor) {
    final hasData = categories.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: shadowColor, offset: const Offset(0, 2), blurRadius: 2)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.star, size: 14, color: textColor),
                  const SizedBox(width: 5),
                  Text("Top Categories", style: GoogleFonts.dmSans(fontSize: 14, color: textColor)),
                ],
              ),
              const SizedBox(height: 15),
              if (!hasData)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("No expense categories yet", style: GoogleFonts.dmSans(color: AppColors.lightSecondaryText)),
                  ),
                )
              else
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: PieChart(
                        PieChartData(
                          sectionsSpace: 2,
                          centerSpaceRadius: 30,
                          sections: categories.asMap().entries.map((entry) {
                            final idx = entry.key;
                            final c = entry.value;
                            final total = categories.fold<double>(0, (sum, cat) => sum + cat.amount);
                            final pct = total > 0 ? (c.amount / total * 100) : 0.0;
                            return PieChartSectionData(
                              color: _pieColors[idx % _pieColors.length],
                              value: c.amount,
                              title: "${pct.toStringAsFixed(0)}%",
                              radius: 45,
                              titleStyle: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: categories.take(5).toList().asMap().entries.map((entry) {
                          final idx = entry.key;
                          final c = entry.value;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: _pieColors[idx % _pieColors.length],
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(child: Text(c.category, style: GoogleFonts.dmSans(fontSize: 12), overflow: TextOverflow.ellipsis)),
                                Text("\$${c.amount.toStringAsFixed(0)}", style: GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickMonth() async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: controller.selectedMonth.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.changeMonth(DateTime(picked.year, picked.month));
    }
  }
}
