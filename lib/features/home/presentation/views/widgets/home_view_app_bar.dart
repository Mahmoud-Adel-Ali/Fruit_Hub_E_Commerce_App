import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/get_user_data.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/notifications_icon_widget.dart';

AppBar homeViewAppBar() {
  return AppBar(
    backgroundColor: AppColors.white,
    flexibleSpace: Container(color: AppColors.white),
    leading: Padding(
      padding: EdgeInsets.only(right: 12),
      child: CircleAvatar(
        radius: 22,
        child: Image.asset(Assets.imagesProfileImage, fit: BoxFit.contain),
      ),
    ),
    title: Column(
      children: [
        Text(
          'صباح الخير !..',
          style: AppTextStyles.regular16.copyWith(color: AppColors.grey),
        ),
        Text(
          getUserData().name,
          style: AppTextStyles.bold16.copyWith(color: Color(0xFF0C0D0D)),
        ),
      ],
    ),
    actions: [NotificationsIconwidget()],
  );
}
