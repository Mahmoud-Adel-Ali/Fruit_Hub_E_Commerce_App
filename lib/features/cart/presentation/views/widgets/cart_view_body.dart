import 'package:flutter/material.dart';

import 'cart_view_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CartViewHeader(productsLength: 3),
        //
      ],
    );
  }
}
