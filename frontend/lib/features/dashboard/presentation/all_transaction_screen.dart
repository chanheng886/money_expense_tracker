import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive_layout.dart';
import 'package:frontend/features/dashboard/ui/transaction_screen/transaction_screen_desktop.dart';
import 'package:frontend/features/dashboard/ui/transaction_screen/transaction_screen_mobile.dart';

class AllTransactionScreen extends StatelessWidget {
  const AllTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreen: TransactionScreenMobile(),
      desktopScreen: TransactionScreenDesktop(),
    );
  }
}
