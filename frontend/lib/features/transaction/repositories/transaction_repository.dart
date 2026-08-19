import 'package:frontend/data/database_helper.dart';
import 'package:frontend/features/transaction/models/transaction_model.dart';

class TransactionRepository {
  //✅✅ Get All Transactions
  Future<List<TransactionModel>> getAlTransactions() async {
    final db = await DatabaseHelper.database;
    final result = await db.query('transactions', orderBy: 'id DESC');
    return result.map((e) => TransactionModel.fromJson(e)).toList();
  }

  //✅✅ Insert Transactions
  Future<int> insertTransaction(TransactionModel transaction) async {
    final db = await DatabaseHelper.database;
    return await db.insert('transactions', transaction.toJson());
  }

  //✅✅ Delete Transaction
  Future<int> deleteTransaction(int id) async {
    final db = await DatabaseHelper.database;
    return await db.delete('transactions', where: 'id=?', whereArgs: [id]);
  }

  //✅✅ Update Transaction
}
