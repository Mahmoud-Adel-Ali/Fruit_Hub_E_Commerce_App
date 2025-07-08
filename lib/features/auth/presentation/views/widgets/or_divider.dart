import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_divider.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 18,
      children: [
        Expanded(child: CustomDivider()),
        Text('أو', style: AppTextStyles.semiBold16),
        Expanded(child: CustomDivider()),
      ],
    );
  }
}
