import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomToggleWidget extends StatefulWidget {
  final String title;
  final bool initialValue;
  final Function(bool) onChanged;

  const CustomToggleWidget({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<CustomToggleWidget> createState() => _CustomToggleWidgetState();
}

class _CustomToggleWidgetState extends State<CustomToggleWidget> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
          value: value,
          activeThumbColor: AppColors.white,
          activeTrackColor: AppColors.primaryColor,
          inactiveThumbColor: AppColors.white,
          inactiveTrackColor: Colors.grey.shade300,
          onChanged: (newValue) {
            setState(() => value = newValue);
            widget.onChanged(newValue);
          },
        ),
        const SizedBox(width: 8),
        Text(
          widget.title,
          style: AppTextStyles.semiBold16.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
