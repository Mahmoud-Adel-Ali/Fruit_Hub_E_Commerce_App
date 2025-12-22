import 'package:flutter/material.dart';
import 'package:fruit_hub_e_commerce_app/core/utils/app_colors.dart';

abstract class AppDecorations {
  static var greyBoxDecoration = BoxDecoration(
    color: AppColors.greyWithShade100,
    border: Border.all(width: 1.5, color: Colors.transparent),
    borderRadius: BorderRadius.circular(16.0),
  );

  static var greyBoxDecorationPrimaryBorder = BoxDecoration(
    color: AppColors.greyWithShade100,
    border: Border.all(width: 1.5, color: AppColors.primaryColor),
    borderRadius: BorderRadius.circular(16.0),
  );
}
