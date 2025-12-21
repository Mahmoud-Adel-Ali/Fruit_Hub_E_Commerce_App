import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trillingText,
    required this.isSelected,
  });
  final String title, subtitle, trillingText;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: isSelected ? AppColors.primaryColor : AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: AppTextStyles.semiBold16.copyWith(color: Colors.black),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.regular13.copyWith(color: Colors.grey),
        ),
        trailing: Text(
          trillingText,
          style: AppTextStyles.bold13.copyWith(
            color: AppColors.lightPrimaryColor,
          ),
        ),
        leading: RadioGroup(
          groupValue: isSelected,
          onChanged: (value) {},
          child: Radio(value: isSelected, activeColor: AppColors.primaryColor),
        ),
      ),
    );
  }
}
