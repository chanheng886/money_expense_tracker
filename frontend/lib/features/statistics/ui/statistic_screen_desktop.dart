import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatisticScreenDesktop extends StatefulWidget {
  const StatisticScreenDesktop({super.key});

  @override
  State<StatisticScreenDesktop> createState() => _StatisticScreenDesktopState();
}

class _StatisticScreenDesktopState extends State<StatisticScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Statistic Screen Desktop")));
  }
}
