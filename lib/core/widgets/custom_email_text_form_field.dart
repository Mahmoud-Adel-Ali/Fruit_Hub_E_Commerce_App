import 'package:flutter/material.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/custom_text_form_field.dart';

class CustomEmailTextFormField extends StatelessWidget {
  const CustomEmailTextFormField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'البريد الإلكتروني',
      keyboardType: TextInputType.emailAddress,
      validator: (email) {
        if (email == null || email.isEmpty) {
          return 'البريد الإلكتروني مطلوب';
        }
        return null;
      },
      controller: controller,
    );
  }
}
