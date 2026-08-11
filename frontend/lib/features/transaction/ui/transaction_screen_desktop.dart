import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionScreenDesktop extends StatefulWidget {
  const TransactionScreenDesktop({super.key});

  @override
  State<TransactionScreenDesktop> createState() =>
      _TransactionScreenDesktopState();
}

class _TransactionScreenDesktopState extends State<TransactionScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Transaction Screen Desktop")));
  }
}
