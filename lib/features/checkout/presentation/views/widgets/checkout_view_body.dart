import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import 'checkout_steps.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: const Column(
        children: [
          CheckoutSteps(),
          //
        ],
      ),
    );
  }
}
