import 'package:flutter/cupertino.dart';
import 'package:frontend/core/responsive/responsive_layout.dart';
import 'package:frontend/features/transaction/ui/transaction_screen_desktop.dart';
import 'package:frontend/features/transaction/ui/transaction_screen_mobile.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreen: const TransactionScreenMobile(),
      desktopScreen: const TransactionScreenDesktop(),
    );
  }
}
