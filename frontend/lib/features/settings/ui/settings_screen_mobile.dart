import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/theme_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreenMobile extends StatelessWidget {
  const SettingsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
        ),
        title: Text(
          "Settings",
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _sectionLabel("Appearance", isDark),
          const SizedBox(height: 8),
          _buildDarkModeToggle(themeController, isDark),
          const SizedBox(height: 24),
          _sectionLabel("Account", isDark),
          const SizedBox(height: 8),
          _buildTile(
            icon: FontAwesomeIcons.userGear,
            title: "Account Settings",
            isDark: isDark,
            onTap: () {},
          ),
          _buildTile(
            icon: FontAwesomeIcons.bell,
            title: "Notifications",
            isDark: isDark,
            onTap: () {},
          ),
          const SizedBox(height: 24),
          _sectionLabel("Support", isDark),
          const SizedBox(height: 8),
          _buildTile(
            icon: FontAwesomeIcons.circleQuestion,
            title: "Help & Support",
            isDark: isDark,
            onTap: () {},
          ),
          _buildTile(
            icon: FontAwesomeIcons.shieldHalved,
            title: "Privacy Policy",
            isDark: isDark,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text, bool isDark) {
    return Text(
      text,
      style: GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: isDark ? AppColors.darkSecondaryText : AppColors.lightSecondaryText,
      ),
    );
  }

  Widget _buildDarkModeToggle(ThemeController controller, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Obx(
        () => SwitchListTile(
          secondary: FaIcon(
            controller.isDark ? FontAwesomeIcons.moon : FontAwesomeIcons.sun,
            color: controller.isDark ? AppColors.amber : AppColors.blue,
            size: 18,
          ),
          title: Text(
            "Dark Mode",
            style: GoogleFonts.dmSans(fontSize: 15),
          ),
          subtitle: Text(
            controller.isDark ? "Dark theme enabled" : "Light theme enabled",
            style: GoogleFonts.dmSans(
              fontSize: 12,
              color: isDark ? AppColors.darkSecondaryText : AppColors.lightSecondaryText,
            ),
          ),
          value: controller.isDark,
          onChanged: (_) => controller.toggleTheme(),
          activeColor: AppColors.blue,
        ),
      ),
    );
  }

  Widget _buildTile({
    required FaIconData icon,
    required String title,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black26 : Colors.grey.shade200,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: FaIcon(icon, size: 18, color: isDark ? AppColors.darkIcon : AppColors.lightIcon),
          title: Text(title, style: GoogleFonts.dmSans(fontSize: 15)),
          trailing: FaIcon(
            FontAwesomeIcons.angleRight,
            size: 14,
            color: isDark ? AppColors.darkSecondaryText : AppColors.lightSecondaryText,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
