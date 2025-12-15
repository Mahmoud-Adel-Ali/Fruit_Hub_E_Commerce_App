import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/cart_view_body.dart';
import 'widgets/payment_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'السلة', showBack: false),
      body: const CartViewBody(),
      bottomNavigationBar: PaymentButton(),
    );
  }
}
