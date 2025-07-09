import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class TermsAndConditionsSection extends StatefulWidget {
  const TermsAndConditionsSection({super.key, this.onChanged});
  final ValueChanged<bool>? onChanged;
  @override
  State<TermsAndConditionsSection> createState() =>
      _TermsAndConditionsSectionState();
}

class _TermsAndConditionsSectionState extends State<TermsAndConditionsSection> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(10, 0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Transform.scale(
          scale: 1.5,
          child: Checkbox(
            value: isChecked,
            onChanged: (value) {
              isChecked = value!;
              setState(() {});
              widget.onChanged!(value);
            },
            activeColor: AppColors.primaryColor,
            checkColor: Colors.white,
            side: BorderSide(color: AppColors.lightGrey),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
        ),

        title: Text.rich(
          TextSpan(
            text: 'من خلال إنشاء حساب ، فإنك توافق على ',
            style: AppTextStyles.semiBold13,
            children: [
              TextSpan(
                text: 'الشروط والأحكام الخاصة بنا',
                style: AppTextStyles.semiBold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
