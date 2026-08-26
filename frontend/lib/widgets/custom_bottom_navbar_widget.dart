import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/viewmodel/nav_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavbarWidget extends StatelessWidget {
  CustomBottomNavbarWidget({super.key});
  final NavController controller = Get.put(NavController());

  final List<_NavItem> items = const [
    _NavItem(icon: FontAwesomeIcons.cube, label: "Dashboard"),
    _NavItem(icon: FontAwesomeIcons.chartLine, label: "Stats"),
    _NavItem(icon: FontAwesomeIcons.circlePlus, label: "Add"),
    _NavItem(icon: FontAwesomeIcons.user, label: "Me"),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.darkCard : Colors.white;
    final selectedBg = isDark ? AppColors.blue : const Color(0xff1E293B);
    final unselectedColor = isDark ? AppColors.darkSecondaryText : Colors.black;

    return Container(
      color: bgColor,
      height: 65,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = controller.currentIndex.value == index;
            return GestureDetector(
              onTap: () => controller.changeTab(index),
              child: Container(
                height: 50,
                width: 70,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: isSelected ? selectedBg : bgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      item.icon,
                      color: isSelected ? Colors.white : unselectedColor,
                    ),
                    Text(
                      item.label,
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: isSelected ? Colors.white : unselectedColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final FaIconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}
