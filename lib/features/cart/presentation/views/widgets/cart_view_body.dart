import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'cart_items_list_view.dart';
import 'cart_view_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const Column(
        children: [
          CartViewHeader(productsLength: 3),
          SizedBox(height: 24),
          Divider(color: AppColors.lightGrey, thickness: 1, height: 0),
          CartItemsListView(cartItems: []),
        ],
      ),
    );
  }
}
