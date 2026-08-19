import 'package:frontend/features/transaction/repositories/transaction_repository.dart';
import 'package:frontend/features/transaction/viewmodels/transaction_viewmodel.dart';
import 'package:frontend/viewmodel/nav_controller.dart';
import 'package:get/get.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavController>(() => NavController());
    Get.lazyPut<TransactionRepository>(() => TransactionRepository());
    Get.lazyPut<TransactionViewmodel>(
      () => TransactionViewmodel(Get.find<TransactionRepository>()),
    );
  }
}
