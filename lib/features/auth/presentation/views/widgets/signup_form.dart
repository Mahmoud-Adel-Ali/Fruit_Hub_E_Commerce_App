import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_email_text_form_field.dart';
import '../../../../../core/widgets/custom_name_text_form_field.dart';
import '../../../../../core/widgets/custom_password_text_form_field.dart';
import 'terms_and_conditions_section.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        const CustomNameTextFormField(),
        const CustomEmailTextFormField(),
        const CustomPasswordTextFormField(),
        const TermsAndConditionsSection(),
        const SizedBox(height: 12),
        CustomButton(text: "إنشاء حساب جديد", onPressed: () {}),
      ],
    );
  }
}
