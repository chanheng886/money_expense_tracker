import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/features/statistics/viewmodels/statistics_viewmodel.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StatisticScreenDesktop extends GetView<StatisticsViewmodel> {
  const StatisticScreenDesktop({super.key});

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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildHeader(isDark, cardColor, borderColor, textColor, secondaryTextColor),
              const SizedBox(height: 20),
              _buildSummaryCards(context, isDark, cardColor, shadowColor, textColor, secondaryTextColor),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: _buildBarChart(daily, hasData, isDark, cardColor, shadowColor, textColor, secondaryTextColor)),
                  const SizedBox(width: 20),
                  Expanded(flex: 2, child: _buildPieChart(categories, isDark, cardColor, shadowColor, textColor)),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildHeader(bool isDark, Color cardColor, Color borderColor, Color textColor, Color secondaryTextColor) {
    return Row(
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
    );
  }

  Widget _buildSummaryCards(BuildContext context, bool isDark, Color cardColor, Color shadowColor, Color textColor, Color secondaryTextColor) {
    return Obx(() {
      final income = controller.totalIncome.value;
      final expense = controller.totalExpense.value;
      final bal = controller.balance.value;
      final pct = income > 0 ? ((income - expense) / income * 100) : 0.0;

      return Row(
        children: [
          _summaryTile("Total Spent", "\$${expense.toStringAsFixed(2)}", FontAwesomeIcons.wallet, AppColors.expense, isDark, cardColor, shadowColor, textColor, secondaryTextColor),
          const SizedBox(width: 15),
          _summaryTile("Total Income", "\$${income.toStringAsFixed(2)}", FontAwesomeIcons.arrowTrendUp, AppColors.income, isDark, cardColor, shadowColor, textColor, secondaryTextColor),
          const SizedBox(width: 15),
          _summaryTile("Balance", "\$${bal.toStringAsFixed(2)}", FontAwesomeIcons.landmark, AppColors.blue, isDark, cardColor, shadowColor, textColor, secondaryTextColor),
          const SizedBox(width: 15),
          _summaryTile("Savings", "${pct.toStringAsFixed(0)}%", FontAwesomeIcons.piggyBank, AppColors.purple, isDark, cardColor, shadowColor, textColor, secondaryTextColor),
        ],
      );
    });
  }

  Widget _summaryTile(String label, String value, FaIconData icon, Color color, bool isDark, Color cardColor, Color shadowColor, Color textColor, Color secondaryTextColor) {
    return Expanded(
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: shadowColor, offset: const Offset(0, 2), blurRadius: 2)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FaIcon(icon, color: color, size: 16),
            Text(value, style: GoogleFonts.dmSans(fontSize: 22, fontWeight: FontWeight.bold, color: textColor)),
            Text(label, style: GoogleFonts.dmSans(fontSize: 13, color: secondaryTextColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(List dailyExpenses, bool hasData, bool isDark, Color cardColor, Color shadowColor, Color textColor, Color secondaryTextColor) {
    return Container(
      height: 350,
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
            Text("Daily Expenses", style: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
            const SizedBox(height: 10),
            Expanded(
              child: hasData
                  ? BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: dailyExpenses.map((d) => d.amount).fold<double>(0, (a, b) => a > b ? a : b) * 1.2,
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
                                  child: Text('$day', style: GoogleFonts.dmSans(fontSize: 10, color: secondaryTextColor)),
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
                        barGroups: dailyExpenses.map((d) {
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
                    )
                  : Center(child: Text("No expenses this month", style: GoogleFonts.dmSans(color: secondaryTextColor))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart(List categories, bool isDark, Color cardColor, Color shadowColor, Color textColor) {
    final hasData = categories.isNotEmpty;

    return Container(
      height: 350,
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
            Expanded(
              child: hasData
                  ? Column(
                      children: [
                        SizedBox(
                          height: 160,
                          child: PieChart(
                            PieChartData(
                              sectionsSpace: 2,
                              centerSpaceRadius: 35,
                              sections: categories.asMap().entries.map((entry) {
                                final idx = entry.key;
                                final c = entry.value;
                                final total = categories.fold<double>(0, (sum, cat) => sum + cat.amount);
                                final pct = total > 0 ? (c.amount / total * 100) : 0.0;
                                return PieChartSectionData(
                                  color: _pieColors[idx % _pieColors.length],
                                  value: c.amount,
                                  title: "${pct.toStringAsFixed(0)}%",
                                  radius: 40,
                                  titleStyle: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...categories.take(5).toList().asMap().entries.map((entry) {
                          final idx = entry.key;
                          final c = entry.value;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: _pieColors[idx % _pieColors.length],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Expanded(child: Text(c.category, style: GoogleFonts.dmSans(fontSize: 11), overflow: TextOverflow.ellipsis)),
                                Text("\$${c.amount.toStringAsFixed(0)}", style: GoogleFonts.dmSans(fontSize: 11, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          );
                        }),
                      ],
                    )
                  : Center(child: Text("No expense categories yet", style: GoogleFonts.dmSans(color: AppColors.lightSecondaryText))),
            ),
          ],
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
