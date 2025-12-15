import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'cart_item.dart';
import 'cart_view_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CartViewHeader(productsLength: 3),
        SizedBox(height: 24),
        Divider(color: AppColors.lightGrey, thickness: 1, height: 0),
        CartItem(),
        CartItem(),
      ],
    );
  }
}
