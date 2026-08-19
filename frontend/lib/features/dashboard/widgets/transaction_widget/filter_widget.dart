// import 'package:flutter/material.dart';
// import 'package:frontend/features/dashboard/viewmodel/transaction_viewmodel.dart';
// import 'package:get/get.dart';

// class FilterWidget extends StatelessWidget {
//   final TransactionViewmodel controller = Get.find<TransactionViewmodel>();
//   FilterWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final filter = ["All", "Expenses", "Income"];
//     return Obx(
//       () => Wrap(
//         spacing: 10,
//         children: filter.map((filter) {
//           return ChoiceChip(
//             label: Text(filter),
//             selected: controller.selectedFilter.value == filter,
//             onSelected: (_) => controller.selectedFilter(filter),
//             selectedColor: Colors.black87, // active style
//             labelStyle: TextStyle(
//               color: controller.selectedFilter.value == filter
//                   ? Colors.white
//                   : Colors.black,
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
