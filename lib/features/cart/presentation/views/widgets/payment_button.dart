
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      color: Colors.transparent,
      child: CustomButton(text: "الدفع 120 جنيه", onPressed: () {}),
    );
  }
}
