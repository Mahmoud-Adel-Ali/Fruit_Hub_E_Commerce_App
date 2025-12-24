import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.color,
    this.borderColor,
  });
  final Function()? onPressed;
  final String text;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color ?? AppColors.primaryColor,
      minWidth: MediaQuery.sizeOf(context).width,
      height: 54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(
          color: borderColor ?? AppColors.primaryColor,
          width: 2,
        ),
      ),
      child: Text(
        text,
        style: AppTextStyles.bold16.copyWith(color: textColor ?? Colors.white),
      ),
    );
  }
}
