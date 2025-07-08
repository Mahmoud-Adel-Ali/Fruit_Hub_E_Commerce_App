import 'package:flutter/material.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/custom_text_form_field.dart';

class CustomNameTextFormField extends StatelessWidget {
  const CustomNameTextFormField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'الاسم الكامل',
      keyboardType: TextInputType.name,
      validator: (name) {
        if (name == null || name.isEmpty) {
          return 'الاسم مطلوب';
        }
        return null;
      },
      controller: controller,
    );
  }
}
