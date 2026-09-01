import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/viewmodel/nav_controller.dart';
import 'package:get/get.dart';

class CustomBottomNavbarWidget extends StatelessWidget {
  CustomBottomNavbarWidget({super.key});
  final NavController controller = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.darkCard : Colors.white;
    final selectedBg = isDark ? AppColors.blue : const Color(0xff1E293B);
    final unselectedColor = isDark ? AppColors.darkSecondaryText : Colors.black;

    final items = [
      _NavItem(icon: FontAwesomeIcons.cube, labelKey: 'nav_dashboard'),
      _NavItem(icon: FontAwesomeIcons.chartLine, labelKey: 'nav_statistics'),
      _NavItem(icon: FontAwesomeIcons.circlePlus, labelKey: 'amount'),
      _NavItem(icon: FontAwesomeIcons.user, labelKey: 'nav_profile'),
    ];

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
                      size: 16,
                      color: isSelected ? Colors.white : unselectedColor,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.labelKey.tr,
                      style: AppTheme.font(
                        context,
                        fontSize: 11,
                        color: isSelected ? Colors.white : unselectedColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
  final String labelKey;
  const _NavItem({required this.icon, required this.labelKey});
}
