import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/localization/language_controller.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/core/theme/theme_controller.dart';
import 'package:get/get.dart';

class SettingsScreenDesktop extends StatelessWidget {
  const SettingsScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final languageController = Get.find<LanguageController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
        ),
        title: Text(
          'settings'.tr,
          style: AppTheme.font(
            context,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            children: [
              _sectionLabel('appearance'.tr, isDark, context),
              const SizedBox(height: 8),
              _buildDarkModeToggle(themeController, isDark, context),
              const SizedBox(height: 12),
              _buildLanguageSelector(context, languageController, isDark),
              const SizedBox(height: 24),
              _sectionLabel('account'.tr, isDark, context),
              const SizedBox(height: 8),
              _buildTile(
                context: context,
                icon: FontAwesomeIcons.userGear,
                title: 'account_settings'.tr,
                isDark: isDark,
                onTap: () {},
              ),
              _buildTile(
                context: context,
                icon: FontAwesomeIcons.bell,
                title: 'notifications'.tr,
                isDark: isDark,
                onTap: () {},
              ),
              const SizedBox(height: 24),
              _sectionLabel('support'.tr, isDark, context),
              const SizedBox(height: 8),
              _buildTile(
                context: context,
                icon: FontAwesomeIcons.circleQuestion,
                title: 'help_support'.tr,
                isDark: isDark,
                onTap: () {},
              ),
              _buildTile(
                context: context,
                icon: FontAwesomeIcons.shieldHalved,
                title: 'privacy_policy'.tr,
                isDark: isDark,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel(String text, bool isDark, BuildContext context) {
    return Text(
      text,
      style: AppTheme.font(
        context,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color:
            isDark ? AppColors.darkSecondaryText : AppColors.lightSecondaryText,
      ),
    );
  }

  Widget _buildDarkModeToggle(
    ThemeController controller,
    bool isDark,
    BuildContext context,
  ) {
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
            'dark_mode'.tr,
            style: AppTheme.font(context, fontSize: 15),
          ),
          subtitle: Text(
            controller.isDark
                ? 'dark_theme_enabled'.tr
                : 'light_theme_enabled'.tr,
            style: AppTheme.font(
              context,
              fontSize: 12,
              color: isDark
                  ? AppColors.darkSecondaryText
                  : AppColors.lightSecondaryText,
            ),
          ),
          value: controller.isDark,
          onChanged: (_) => controller.toggleTheme(),
          activeThumbColor: AppColors.blue,
        ),
      ),
    );
  }

  Widget _buildLanguageSelector(
    BuildContext context,
    LanguageController controller,
    bool isDark,
  ) {
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
        () => ListTile(
          leading: const FaIcon(
            FontAwesomeIcons.globe,
            color: AppColors.blue,
            size: 18,
          ),
          title: Text(
            'language'.tr,
            style: AppTheme.font(context, fontSize: 15),
          ),
          subtitle: Text(
            controller.isKhmer ? 'ភាសាខ្មែរ (Khmer)' : 'English',
            style: AppTheme.font(
              context,
              fontSize: 12,
              color: isDark
                  ? AppColors.darkSecondaryText
                  : AppColors.lightSecondaryText,
            ),
          ),
          trailing: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: controller.isKhmer ? 'km' : 'en',
              icon: const FaIcon(FontAwesomeIcons.angleDown, size: 14),
              onChanged: (val) {
                if (val != null) controller.setLanguage(val);
              },
              items: const [
                DropdownMenuItem(
                  value: 'en',
                  child: Text('🇬🇧 English'),
                ),
                DropdownMenuItem(
                  value: 'km',
                  child: Text('🇰🇭 ភាសាខ្មែរ'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTile({
    required BuildContext context,
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
          leading: FaIcon(
            icon,
            size: 18,
            color: isDark ? AppColors.darkIcon : AppColors.lightIcon,
          ),
          title: Text(
            title,
            style: AppTheme.font(context, fontSize: 15),
          ),
          trailing: FaIcon(
            FontAwesomeIcons.angleRight,
            size: 14,
            color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.lightSecondaryText,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
