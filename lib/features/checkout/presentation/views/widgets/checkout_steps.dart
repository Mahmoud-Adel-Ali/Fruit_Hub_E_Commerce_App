import 'package:flutter/material.dart';

import 'active_step_item.dart';

List<String> steps = ['الشحن', 'العنوان', 'الدفع', 'المراجعه'];

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(steps.length, (index) {
        return Expanded(child: ActiveStepItem(text: steps[index]));
      }),
    );
  }
}
