import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class IForgetMyPasswordWidget extends StatelessWidget {
  const IForgetMyPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextButton(
          text: "نسيت كلمة المرور؟",
          style: AppTextStyles.semiBold13.copyWith(
            color: AppColors.lightPrimaryColor,
            decoration: TextDecoration.underline,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
