import 'package:frontend/features/dashboard/models/transaction.dart';

class TransactionService {
  final List<Transaction> _transactions = [
    Transaction(
      id: 1,
      title: "Buy a keyboard",
      subTitle: 'Today, 5:00 PM',
      money: -12,
    ),
    Transaction(
      id: 2,
      title: "Salary Payment",
      subTitle: "Aug 10, 9:00 AM",
      money: 2500,
    ),

    Transaction(
      id: 3,
      title: "Coffee with friends",
      subTitle: "Aug 11, 3:30 PM",
      money: -8.5,
    ),

    Transaction(
      id: 4,
      title: "Freelance Project",
      subTitle: "Aug 09, 7:00 PM",
      money: 600,
    ),
  ];

  List<Transaction> getTransactions() => _transactions;
}
