import 'package:flutter/cupertino.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget desktopScreen;
  const ResponsiveLayout({
    super.key,
    required this.mobileScreen,
    required this.desktopScreen,
  });

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return mobileScreen;
    }
    return desktopScreen;
  }
}
