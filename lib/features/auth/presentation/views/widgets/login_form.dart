import 'package:flutter/material.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/custom_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_email_text_form_field.dart';
import '../../../../../core/widgets/custom_password_text_form_field.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomEmailTextFormField(),
        CustomPasswordTextFormField(),
        Row(
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
        ),
        SizedBox(height: 16),
        CustomButton(text: "تسجيل الدخول", onPressed: () {}),
      ],
    );
  }
}
