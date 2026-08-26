import 'package:frontend/features/statistics/services/statistics_service.dart';
import 'package:frontend/features/transaction/viewmodels/transaction_viewmodel.dart';
import 'package:get/get.dart';

class StatisticsViewmodel extends GetxController {
  final TransactionViewmodel _transactionVm;
  final StatisticsService _service = StatisticsService();

  StatisticsViewmodel(this._transactionVm);

  final selectedMonth = DateTime.now().obs;
  final totalExpense = 0.0.obs;
  final totalIncome = 0.0.obs;
  final balance = 0.0.obs;
  final dailyExpenses = <DailyExpense>[].obs;
  final categoryBreakdown = <CategoryExpense>[].obs;
  final topCategory = '-'.obs;
  final topCategoryPercent = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    ever(_transactionVm.transactions, (_) => computeStats());
    computeStats();
  }

  void computeStats() {
    final transactions = _transactionVm.transactions;
    final month = selectedMonth.value;

    totalExpense.value = _service.getTotalExpense(transactions, month);
    totalIncome.value = _service.getTotalIncome(transactions, month);
    balance.value = totalIncome.value - totalExpense.value;
    dailyExpenses.value = _service.getDailyExpenses(transactions, month);
    categoryBreakdown.value = _service.getCategoryBreakdown(transactions, month);
    topCategory.value = _service.getTopCategory(transactions, month);
    topCategoryPercent.value = _service.getTopCategoryPercent(transactions, month);
  }

  void changeMonth(DateTime month) {
    selectedMonth.value = month;
    computeStats();
  }
}
