import 'package:frontend/features/transaction/models/transaction_model.dart';
import 'package:frontend/features/transaction/repositories/transaction_repository.dart';
import 'package:get/get.dart';

class TransactionViewmodel extends GetxController {
  final TransactionRepository transactionRepository;
  TransactionViewmodel(this.transactionRepository);

  final transactions = <TransactionModel>[].obs;
  final isLoading = false.obs;
  final errorMessage = "".obs;

  final searchQuery = "".obs;
  final selectedFilter = "All".obs;

  // Balance Visibility Toggle
  final isBalanceHidden = false.obs;

  void toggleBalanceVisibility() {
    isBalanceHidden.value = !isBalanceHidden.value;
  }

  @override
  void onInit() {
    super.onInit();
    loadAllTransaction();
  }

  // Search & Filter
  void search(String query) {
    searchQuery.value = query;
  }

  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  void clearSearch() {
    searchQuery.value = "";
  }

  List<TransactionModel> get filteredTransactions {
    return transactions.where((t) {
      // 1. Filter by category type
      if (selectedFilter.value == "Expenses" ||
          selectedFilter.value == "Expense") {
        if (t.type?.toLowerCase() != 'expense') return false;
      } else if (selectedFilter.value == "Income") {
        if (t.type?.toLowerCase() != 'income') return false;
      }

      // 2. Filter by search query
      final query = searchQuery.value.trim().toLowerCase();
      if (query.isEmpty) return true;

      final titleMatch = t.title.toLowerCase().contains(query);
      final noteMatch = t.note.toLowerCase().contains(query);
      final amountMatch = t.amount.toString().contains(query);
      final dateMatch = t.date.toLowerCase().contains(query);

      return titleMatch || noteMatch || amountMatch || dateMatch;
    }).toList();
  }

  //✅✅ Load All Transactions
  Future<void> loadAllTransaction() async {
    try {
      isLoading.value = true;
      final result = await transactionRepository.getAlTransactions();
      transactions.assignAll(result);
    } catch (e) {
      throw Exception("Faild to load data: error $e");
    } finally {
      isLoading.value = false;
    }
  }

  //✅✅ Add Transaction
  Future<void> addTransaction(TransactionModel transaction) async {
    await transactionRepository.insertTransaction(transaction);
    await loadAllTransaction();
  }

  Future<void> deleteTransaction(int id) async {
    await transactionRepository.deleteTransaction(id);
    await loadAllTransaction();
  }
}
