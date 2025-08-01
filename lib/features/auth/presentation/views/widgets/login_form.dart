import 'package:flutter/material.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/custom_button.dart';

import '../../../../../core/widgets/custom_email_text_form_field.dart';
import '../../../../../core/widgets/custom_password_text_form_field.dart';
import 'i_forget_my_password_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomEmailTextFormField(),
        CustomPasswordTextFormField(),
        IForgetMyPasswordWidget(),
        SizedBox(height: 16),
        CustomButton(text: "تسجيل الدخول", onPressed: () {}),
      ],
    );
  }
}
