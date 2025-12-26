import 'package:flutter/material.dart';

import 'step_item.dart';

List<String> steps = [
  'الشحن', 'العنوان', 'الدفع',
  //  'المراجعه'
];

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentStep});
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(steps.length, (index) {
        return Expanded(
          child: StepItem(
            text: steps[index],
            index: index,
            isActive: index <= currentStep,
          ),
        );
      }),
    );
  }
}
