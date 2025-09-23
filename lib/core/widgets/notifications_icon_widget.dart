import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class NotificationsIconwidget extends StatelessWidget {
  const NotificationsIconwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.green50,
              child: SvgPicture.asset(Assets.imagesNotificationIcon),
            ),
            const Positioned(
              top: 8,
              right: 20,
              child: CircleAvatar(radius: 3, backgroundColor: AppColors.red),
            ),
          ],
        ),
      ),
    );
  }
}
