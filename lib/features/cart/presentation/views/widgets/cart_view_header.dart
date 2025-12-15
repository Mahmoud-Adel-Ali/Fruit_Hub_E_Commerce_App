import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/functions/to_product_num_string.dart';

class CartViewHeader extends StatelessWidget {
  const CartViewHeader({super.key, required this.productsLength});
  final int productsLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.green50),
      child: Center(
        child: Text(
          toProductNumString(productsLength),
          style: AppTextStyles.regular22.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
