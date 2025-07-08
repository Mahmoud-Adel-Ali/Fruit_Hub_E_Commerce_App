import 'package:flutter/material.dart';
import 'package:fruit_hub_e_commerce_app/core/widgets/custom_text_form_field.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<CustomPasswordTextFormField> createState() => _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState extends State<CustomPasswordTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      controller: widget.controller,
      validator: (password) {
        if (password == null || password.isEmpty) {
          return 'كلمة المرور مطلوبة';
        } else if (password.length < 8) {
          return 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';
        }
        return null;
      },
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
