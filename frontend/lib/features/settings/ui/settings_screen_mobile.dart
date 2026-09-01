import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/core/localization/language_controller.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/core/theme/theme_controller.dart';
import 'package:get/get.dart';

class SettingsScreenMobile extends StatelessWidget {
  const SettingsScreenMobile({super.key});

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
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
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
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                controller.isKhmer ? '🇰🇭 ខ្មែរ' : '🇬🇧 EN',
                style: AppTheme.font(
                  context,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blue,
                ),
              ),
              const SizedBox(width: 6),
              FaIcon(
                FontAwesomeIcons.angleRight,
                size: 14,
                color: isDark
                    ? AppColors.darkSecondaryText
                    : AppColors.lightSecondaryText,
              ),
            ],
          ),
          onTap: () => _showLanguageBottomSheet(context, controller, isDark),
        ),
      ),
    );
  }

  void _showLanguageBottomSheet(
    BuildContext context,
    LanguageController controller,
    bool isDark,
  ) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'select_language'.tr,
                  style: AppTheme.font(
                    context,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _languageOptionTile(
              context: context,
              flag: '🇬🇧',
              title: 'English',
              subtitle: 'English (US)',
              isSelected: !controller.isKhmer,
              isDark: isDark,
              onTap: () {
                controller.setLanguage('en');
                Get.back();
              },
            ),
            const SizedBox(height: 10),
            _languageOptionTile(
              context: context,
              flag: '🇰🇭',
              title: 'ភាសាខ្មែរ',
              subtitle: 'Khmer (Kantumruy Pro Font)',
              isSelected: controller.isKhmer,
              isDark: isDark,
              onTap: () {
                controller.setLanguage('km');
                Get.back();
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _languageOptionTile({
    required BuildContext context,
    required String flag,
    required String title,
    required String subtitle,
    required bool isSelected,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark
                  ? AppColors.blue.withValues(alpha: 0.2)
                  : AppColors.blue.withValues(alpha: 0.1))
              : (isDark ? AppColors.darkBorder : Colors.grey.shade100),
          border: Border.all(
            color: isSelected ? AppColors.blue : Colors.transparent,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.font(
                      context,
                      fontSize: 16,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected ? AppColors.blue : null,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppTheme.font(
                      context,
                      fontSize: 12,
                      color: isDark
                          ? AppColors.darkSecondaryText
                          : Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: AppColors.blue,
                size: 22,
              ),
          ],
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
