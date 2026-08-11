class Transaction {
  final int id;
  final String title;
  final String subTitle;
  final double money;

  Transaction({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.money,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      title: json['title'],
      subTitle: json['subTitle'],
      money: json['money'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'subTitle': subTitle, 'money': money};
  }
}
