import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("الاكثر مبيعا", style: AppTextStyles.semiBold16),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, BestSellingView.routeName);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text("المزيد", style: AppTextStyles.semiBold13),
        ),
      ],
    );
  }
}
