import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // General
          'app_name': 'Expense Tracker',
          'success': 'Success',
          'cancel': 'Cancel',
          'save': 'Save',
          'done': 'Done',
          'reset': 'Reset',

          // Navigation / Bottom Bar
          'nav_dashboard': 'Dashboard',
          'nav_transaction': 'Transaction',
          'nav_statistics': 'Statistics',
          'nav_profile': 'Profile',

          // Dashboard
          'good_morning': 'Good morning',
          'total_balance': 'TOTAL BALANCE',
          'income': 'Income',
          'expense': 'Expense',
          'recent_transactions': 'Recent Transactions',
          'see_all': 'See all',
          'no_transactions': 'No transactions 😃',

          // Transactions
          'transactions': 'Transactions',
          'add_transactions': 'Add Transactions',
          'all_transactions': 'All Transactions',
          'search_hint': 'Search transactions, notes, amounts...',
          'all': 'All',
          'expenses': 'Expenses',
          'incomes': 'Incomes',
          'amount': 'Amount',
          'category': 'Category',
          'select_category': 'Select Category',
          'title': 'Title',
          'add_title': 'Add titles...',
          'note': 'Note',
          'add_notes': 'Add notes...',
          'expense_btn': 'Expense',
          'income_btn': 'Income',
          'expense_added_success': 'Expense added successfully!',
          'income_added_success': 'Income added successfully!',
          'no_matching_transactions': 'No matching transactions',
          'no_matching_desc': 'No transactions found matching your criteria',
          'reset_filters': 'Reset Filters',

          // Statistics
          'statistics': 'Statistics',
          'total_spent': 'Total Spent',
          'total_income': 'Total Income',
          'balance': 'Balance',
          'savings': 'Savings',
          'weekly': 'Weekly',
          'monthly': 'Monthly',
          'yearly': 'Yearly',
          'spending_breakdown': 'Spending Breakdown',

          // Settings
          'settings': 'Settings',
          'appearance': 'Appearance',
          'dark_mode': 'Dark Mode',
          'dark_theme_enabled': 'Dark theme enabled',
          'light_theme_enabled': 'Light theme enabled',
          'language': 'Language',
          'language_subtitle': 'Change app language',
          'language_english': 'English',
          'language_khmer': 'ភាសាខ្មែរ (Khmer)',
          'select_language': 'Select Language',
          'account': 'Account',
          'account_settings': 'Account Settings',
          'notifications': 'Notifications',
          'support': 'Support',
          'help_support': 'Help & Support',
          'privacy_policy': 'Privacy Policy',

          // Profile
          'profile': 'Profile',
          'edit_profile': 'Edit profile',
          'top_category': 'Top Category',
          'calendar': 'Calendar',
          'personal_info': 'Personal Information',
          'privacy_security': 'Privacy & Security',
          'logout': 'Log out',
        },
        'km_KH': {
          // General
          'app_name': 'កម្មវិធីតាមដានការចំណាយ',
          'success': 'ជោគជ័យ',
          'cancel': 'បោះបង់',
          'save': 'រក្សាទុក',
          'done': 'រួចរាល់',
          'reset': 'កំណត់ឡើងវិញ',

          // Navigation / Bottom Bar
          'nav_dashboard': 'ផ្ទាំងគ្រប់គ្រង',
          'nav_transaction': 'ប្រតិបត្តិការ',
          'nav_statistics': 'ស្ថិតិ',
          'nav_profile': 'ប្រវត្តិរូប',

          // Dashboard
          'good_morning': 'អរុណសួស្តី',
          'total_balance': 'សមតុល្យសរុប',
          'income': 'ចំណូល',
          'expense': 'ចំណាយ',
          'recent_transactions': 'ប្រតិបត្តិការថ្មីៗ',
          'see_all': 'មើលទាំងអស់',
          'no_transactions': 'មិនទាន់មានប្រតិបត្តិការនៅឡើយទេ 😃',

          // Transactions
          'transactions': 'ប្រតិបត្តិការ',
          'add_transactions': 'បន្ថែមប្រតិបត្តិការ',
          'all_transactions': 'ប្រតិបត្តិការទាំងអស់',
          'search_hint': 'ស្វែងរកប្រតិបត្តិការ កំណត់ចំណាំ ចំនួនទឹកប្រាក់...',
          'all': 'ទាំងអស់',
          'expenses': 'ចំណាយ',
          'incomes': 'ចំណូល',
          'amount': 'ចំនួនទឹកប្រាក់',
          'category': 'ប្រភេទ',
          'select_category': 'ជ្រើសរើសប្រភេទ',
          'title': 'ចំណងជើង',
          'add_title': 'បញ្ចូលចំណងជើង...',
          'note': 'កំណត់ចំណាំ',
          'add_notes': 'បញ្ចូលកំណត់ចំណាំ...',
          'expense_btn': 'ចំណាយ',
          'income_btn': 'ចំណូល',
          'expense_added_success': 'បានបន្ថែមចំណាយដោយជោគជ័យ!',
          'income_added_success': 'បានបន្ថែមចំណូលដោយជោគជ័យ!',
          'no_matching_transactions': 'រកមិនឃើញប្រតិបត្តិការដែលត្រូវគ្នាទេ',
          'no_matching_desc': 'រកមិនឃើញប្រតិបត្តិការដែលត្រូវនឹងលក្ខខណ្ឌរបស់អ្នកទេ',
          'reset_filters': 'កំណត់តម្រងឡើងវិញ',

          // Statistics
          'statistics': 'ស្ថិតិ',
          'total_spent': 'ការចំណាយសរុប',
          'total_income': 'ចំណូលសរុប',
          'balance': 'សមតុល្យ',
          'savings': 'ការសន្សំ',
          'weekly': 'ប្រចាំសប្តាហ៍',
          'monthly': 'ប្រចាំខែ',
          'yearly': 'ប្រចាំឆ្នាំ',
          'spending_breakdown': 'ការបែងចែកការចំណាយ',

          // Settings
          'settings': 'ការកំណត់',
          'appearance': 'រូបរាង',
          'dark_mode': 'ទម្រង់ងងឹត',
          'dark_theme_enabled': 'បានបើកទម្រង់ងងឹត',
          'light_theme_enabled': 'បានបើកទម្រង់ភ្លឺ',
          'language': 'ភាសា',
          'language_subtitle': 'ផ្លាស់ប្តូរភាសាក្នុងកម្មវិធី',
          'language_english': 'English (ភាសាអង់គ្លេស)',
          'language_khmer': 'ភាសាខ្មែរ (Khmer)',
          'select_language': 'ជ្រើសរើសភាសា',
          'account': 'គណនី',
          'account_settings': 'ការកំណត់គណនី',
          'notifications': 'ការជូនដំណឹង',
          'support': 'ជំនួយ',
          'help_support': 'ជំនួយ និងការគាំទ្រ',
          'privacy_policy': 'គោលការណ៍ឯកជនភាព',

          // Profile
          'profile': 'ប្រវត្តិរូប',
          'edit_profile': 'កែប្រែប្រវត្តិរូប',
          'top_category': 'ប្រភេទពេញនិយម',
          'calendar': 'ប្រតិទិន',
          'personal_info': 'ព័ត៌មានផ្ទាល់ខ្លួន',
          'privacy_security': 'ឯកជនភាព និងសុវត្ថិភាព',
          'logout': 'ចាកចេញ',
        },
      };
}
