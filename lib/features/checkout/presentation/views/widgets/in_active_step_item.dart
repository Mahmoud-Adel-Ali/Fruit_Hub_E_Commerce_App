import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.text, required this.index});
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: AppColors.lightGrey,
          child: Text('$index', style: AppTextStyles.semiBold13),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.semiBold13.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
