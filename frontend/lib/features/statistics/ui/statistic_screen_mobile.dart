import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatisticScreenMobile extends StatefulWidget {
  const StatisticScreenMobile({super.key});

  @override
  State<StatisticScreenMobile> createState() => _StatisticScreenMobileState();
}

class _StatisticScreenMobileState extends State<StatisticScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Statistic screen mobile")));
  }
}
