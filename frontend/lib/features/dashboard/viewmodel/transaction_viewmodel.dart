import 'package:frontend/features/dashboard/models/transaction.dart';
import 'package:frontend/features/dashboard/services/transaction_service.dart';
import 'package:get/state_manager.dart';

class TransactionViewmodel extends GetxController {
  final TransactionService _service = TransactionService();

  var transactions = <Transaction>[].obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadTransaction();
  }

  Future<void> loadTransaction() async {
    isLoading.value = true;
    errorMessage.value = "";
    try {
      final result = await _service.getTransactions();
      transactions.value = result;
    } catch (e) {
      errorMessage.value = "Can not load transactions: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
