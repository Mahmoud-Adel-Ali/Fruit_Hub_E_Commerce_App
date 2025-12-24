import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class AboutUsParagraph extends StatelessWidget {
  const AboutUsParagraph({super.key, required this.text, required this.index});
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Text(
        "$index. $text",
        style: AppTextStyles.semiBold16.copyWith(
          color: index % 2 == 0 ? AppColors.grey.shade600 : AppColors.black,
        ),
      ),
    );
  }
}
