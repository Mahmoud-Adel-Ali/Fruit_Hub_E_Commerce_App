import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: AppColors.lightGrey,
          child: Text('2', style: AppTextStyles.semiBold13),
        ),
        SizedBox(width: 4),
        Text(
          'الشحن',
          style: AppTextStyles.semiBold13.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
