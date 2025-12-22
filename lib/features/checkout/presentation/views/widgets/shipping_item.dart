import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_decorations.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trillingText,
    required this.isSelected,
    this.onTap,
  });
  final String title, subtitle, trillingText;
  final bool isSelected;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        decoration: isSelected
            ? AppDecorations.greyBoxDecorationPrimaryBorder
            : AppDecorations.greyBoxDecoration,
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
          leading: InkWell(
            onTap: onTap,
            child: RadioGroup<bool>(
              groupValue: isSelected,
              onChanged: (value) {},
              child: Radio(value: true, activeColor: AppColors.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
