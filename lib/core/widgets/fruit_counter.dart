import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_circular_button.dart';

class FruitCounter extends StatefulWidget {
  const FruitCounter({super.key, this.initialValue = 1, this.onChanged});
  final int initialValue;
  final ValueChanged<int>? onChanged;

  @override
  State<FruitCounter> createState() => _FruitCounterState();
}

class _FruitCounterState extends State<FruitCounter> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  void changeValue(int v) {
    value = v;
    setState(() {});
    widget.onChanged!(value);
  }

  @override
  void didUpdateWidget(covariant FruitCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        CustomCircularButton(
          onPressed: () {
            changeValue(value + 1);
          },
        ),
        Text(
          value.toString(),
          style: AppTextStyles.bold16.copyWith(color: AppColors.black),
        ),
        CustomCircularButton(
          onPressed: () {
            if (value > 1) {
              changeValue(value - 1);
            }
          },
          icon: Icons.remove,
          color: AppColors.lightGrey,
          iconColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}
