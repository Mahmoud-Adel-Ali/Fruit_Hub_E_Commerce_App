import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../cart/domain/entities/cart_item_entity.dart';
import 'widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartItems});
  static const String routeName = 'checkout_view';
  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    log("Cart Items Length : ${cartItems.length}");
    return Scaffold(
      appBar: customAppBar(context, title: 'الشحن', showNotifications: false),
      body: const CheckoutViewBody(),
    );
  }
}
