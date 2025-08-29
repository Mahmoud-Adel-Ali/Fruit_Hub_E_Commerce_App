import 'package:flutter/material.dart';

import '../helper_functions/validation_of_input_fields.dart';
import '../utils/app_colors.dart';
import 'custom_text_form_field.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({
    super.key,
    this.controller,
    this.hintText = 'كلمة المرور',
  });
  final TextEditingController? controller;
  final String hintText;

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool showPassword = false, validPassword = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: widget.hintText,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) => validatorOfPassword(value),
      obscureText: !showPassword,
      controller: widget.controller,
      prefixIcon: Icon(
        Icons.lock_outlined,
        color: validPassword ? AppColors.primaryColor : AppColors.grey,
      ),
      suffixIcon: IconButton(
        onPressed: () {
          showPassword = !showPassword;
          setState(() {});
        },
        icon: Icon(
          showPassword ? Icons.visibility : Icons.visibility_off,
          color: validPassword ? AppColors.primaryColor : AppColors.grey,
        ),
      ),
      onChanged: (value) {
        validPassword = validatorOfPasswordBool(value);
        setState(() {});
      },
    );
  }
}
