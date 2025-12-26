import 'package:flutter/material.dart';

import 'active_step_item.dart';
import 'in_active_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.text,
    required this.index,
    required this.isActive,
    this.onTap,
  });
  final String text;
  final int index;
  final bool isActive;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedCrossFade(
        firstChild: InActiveStepItem(text: text, index: index),
        secondChild: ActiveStepItem(text: text),
        crossFadeState: isActive
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300),
      ),
    );
  }
}
