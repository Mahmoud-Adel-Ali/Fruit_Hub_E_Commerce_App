import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton({
    super.key,
    this.icon = Icons.add,
    this.onPressed,
    this.color = AppColors.primaryColor,
    this.iconColor = AppColors.white,
  });
  final IconData icon;
  final VoidCallback? onPressed;
  final Color color, iconColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      color: color,
      minWidth: 36,
      height: 36,
      shape: const CircleBorder(),
      child: Icon(icon, color: iconColor),
    );
  }
}
