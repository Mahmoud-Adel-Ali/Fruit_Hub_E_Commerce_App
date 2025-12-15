import 'package:flutter/material.dart';

import 'cart_item.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const CartItem();
      },
    );
  }
}
