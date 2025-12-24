import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/get_user_data.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Padding(
        padding: EdgeInsets.only(right: 12),
        child: CircleAvatar(
          radius: 32,
          child: Image.asset(Assets.imagesProfileImage, fit: BoxFit.contain),
        ),
      ),
      title: Text(
        getUserData().name,
        style: AppTextStyles.bold16.copyWith(color: AppColors.black),
      ),
      subtitle: Text(
        getUserData().email,
        style: AppTextStyles.bold13.copyWith(color: AppColors.grey),
      ),
    );
  }
}
