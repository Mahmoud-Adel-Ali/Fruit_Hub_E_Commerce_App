import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('لَا تَمْلِكُ حِسَابًا؟', style: AppTextStyles.semiBold16),
        CustomTextButton(text: "قُمْ بِإِنْشَاءِ حِسَابٍ", onPressed: () {}),
      ],
    );
  }
}
