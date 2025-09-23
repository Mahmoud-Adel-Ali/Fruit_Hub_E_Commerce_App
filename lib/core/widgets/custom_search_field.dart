import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        shadows: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        // controller: controller,
        // onChanged: onChanged,
        keyboardType: TextInputType.text,
        style: AppTextStyles.semiBold16,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          hintStyle: AppTextStyles.regular13.copyWith(
            color: AppColors.hintTextColor,
          ),
          hintText: 'ابحث عن.......',
          suffixIcon: SizedBox(
            width: 20,
            child: Center(child: SvgPicture.asset(Assets.imagesFilterIcon)),
          ),
          prefixIcon: SizedBox(
            width: 20,
            child: Center(child: SvgPicture.asset(Assets.imagesSearchIcon)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          focusedBorder: _buildOutlineBorder(),
          errorBorder: errorBorder(context),
          focusedErrorBorder: errorBorder(context),
          enabledBorder: _buildOutlineBorder(color: AppColors.white),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineBorder({
    Color color = AppColors.primaryColorWithOpacity,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: color),
    );
  }

  OutlineInputBorder errorBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: AppColors.red),
    );
  }
}
