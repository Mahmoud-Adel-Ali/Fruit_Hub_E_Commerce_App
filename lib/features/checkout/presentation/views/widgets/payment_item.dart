import 'package:flutter/material.dart';

import '../../../../../core/utils/app_decorations.dart';
import '../../../../../core/utils/app_text_styles.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title :", style: AppTextStyles.bold13),
        const SizedBox(height: 8.0),
        Container(
          width: double.infinity,
          decoration: AppDecorations.greyBoxDecoration,
          child: child,
        ),
      ],
    );
  }
}
