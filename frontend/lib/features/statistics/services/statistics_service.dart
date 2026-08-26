import 'package:frontend/features/transaction/models/transaction_model.dart';

class DailyExpense {
  final int day;
  final double amount;

  DailyExpense(this.day, this.amount);
}

class CategoryExpense {
  final String category;
  final double amount;

  CategoryExpense(this.category, this.amount);
}

class StatisticsService {
  double getTotalExpense(List<TransactionModel> transactions, DateTime month) {
    return transactions
        .where(
          (t) =>
              t.type == 'expense' &&
              t.date.isNotEmpty &&
              _isSameMonth(t.date, month),
        )
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  double getTotalIncome(List<TransactionModel> transactions, DateTime month) {
    return transactions
        .where(
          (t) =>
              t.type == 'income' &&
              t.date.isNotEmpty &&
              _isSameMonth(t.date, month),
        )
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  List<DailyExpense> getDailyExpenses(
    List<TransactionModel> transactions,
    DateTime month,
  ) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final dailyMap = <int, double>{};

    for (int i = 1; i <= daysInMonth; i++) {
      dailyMap[i] = 0;
    }

    for (final t in transactions) {
      if (t.type != 'expense' || t.date.isEmpty) continue;
      if (!_isSameMonth(t.date, month)) continue;

      final day = _parseDay(t.date);
      if (day != null && dailyMap.containsKey(day)) {
        dailyMap[day] = dailyMap[day]! + t.amount;
      }
    }

    return dailyMap.entries
        .map((e) => DailyExpense(e.key, e.value))
        .toList();
  }

  List<CategoryExpense> getCategoryBreakdown(
    List<TransactionModel> transactions,
    DateTime month,
  ) {
    final categoryMap = <String, double>{};

    for (final t in transactions) {
      if (t.type != 'expense' || t.date.isEmpty) continue;
      if (!_isSameMonth(t.date, month)) continue;

      final category = t.title.isEmpty ? 'Other' : t.title;
      categoryMap[category] = (categoryMap[category] ?? 0) + t.amount;
    }

    final sorted = categoryMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sorted
        .map((e) => CategoryExpense(e.key, e.value))
        .toList();
  }

  String getTopCategory(List<TransactionModel> transactions, DateTime month) {
    final breakdown = getCategoryBreakdown(transactions, month);
    if (breakdown.isEmpty) return '-';
    return breakdown.first.category;
  }

  double getTopCategoryPercent(
    List<TransactionModel> transactions,
    DateTime month,
  ) {
    final breakdown = getCategoryBreakdown(transactions, month);
    if (breakdown.isEmpty) return 0;
    final total = breakdown.fold(0.0, (sum, c) => sum + c.amount);
    if (total == 0) return 0;
    return (breakdown.first.amount / total) * 100;
  }

  bool _isSameMonth(String dateStr, DateTime month) {
    final parsed = _parseDate(dateStr);
    if (parsed == null) return false;
    return parsed.year == month.year && parsed.month == month.month;
  }

  DateTime? _parseDate(String dateStr) {
    try {
      final parts = dateStr.split(RegExp(r'[,/\-]'));
      if (parts.length < 3) return null;
      final day = int.parse(parts[0].trim());
      final m = int.parse(parts[1].trim());
      final year = int.parse(parts[2].trim());
      return DateTime(year, m, day);
    } catch (_) {
      return null;
    }
  }

  int? _parseDay(String dateStr) {
    final parsed = _parseDate(dateStr);
    return parsed?.day;
  }
}
