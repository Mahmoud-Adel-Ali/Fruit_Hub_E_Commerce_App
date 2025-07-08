import 'package:flutter/material.dart';
import 'package:fruit_hub_e_commerce_app/core/utils/app_colors.dart';

import '../utils/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final TextStyle? style;
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = AppColors.primaryColor,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style:
            style ??
            AppTextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
            ),
      ),
    );
  }
}
