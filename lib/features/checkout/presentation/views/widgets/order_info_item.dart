import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({
    super.key,
    required this.title,
    required this.price,
    this.isTotal = false,
  });
  final String title;
  final double price;
  final bool isTotal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            title,
            style: isTotal
                ? AppTextStyles.bold16.copyWith(color: AppColors.black)
                : AppTextStyles.semiBold13.copyWith(color: AppColors.grey.shade700),
          ),
          const Spacer(),
          Text(
            "${price.toStringAsFixed(2)} جنيه",
            style: isTotal
                ? AppTextStyles.bold16.copyWith(color: AppColors.black)
                : AppTextStyles.semiBold13.copyWith(color: AppColors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
