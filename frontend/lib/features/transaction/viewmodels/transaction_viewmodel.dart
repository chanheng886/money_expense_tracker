import 'package:frontend/features/transaction/models/transaction_model.dart';
import 'package:frontend/features/transaction/repositories/transaction_repository.dart';
import 'package:get/get.dart';

class TransactionViewmodel extends GetxController {
  final TransactionRepository transactionRepository;
  TransactionViewmodel(this.transactionRepository);

  final transactions = <TransactionModel>[].obs;
  final isLoading = false.obs;
  final errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadAllTransaction();
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
