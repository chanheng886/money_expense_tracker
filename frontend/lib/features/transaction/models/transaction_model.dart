class TransactionModel {
  final int? id;
  final String title;
  final String note;
  final double amount;
  final String? type;
  final String date;

  TransactionModel({
    this.id,
    required this.title,
    required this.note,
    required this.amount,
    this.type,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'note': note,
      'amount': amount,
      'type': type,
      'date': date,
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      title: json['title'],
      note: json['note'],
      amount: json['amount'],
      type: json['type'],
      date: json['date'],
    );
  }
}
