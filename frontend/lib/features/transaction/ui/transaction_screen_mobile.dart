import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionScreenMobile extends StatefulWidget {
  const TransactionScreenMobile({super.key});

  @override
  State<TransactionScreenMobile> createState() =>
      _TransactionScreenMobileState();
}

class _TransactionScreenMobileState extends State<TransactionScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Transaction Screen Mobile")));
  }
}
