import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'logout_dialog.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: AppColors.white,
      // color: AppColors.lightSecondaryColor,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: MaterialButton(
        elevation: 0,
        autofocus: false,
        highlightElevation: 0,
        onPressed: () => logoutDialog(context),
        color: AppColors.green50,
        shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(8.0),
          side: BorderSide.none,
        ),
        child: Row(
          children: [
            const Spacer(flex: 2),
            Text(
              'تسجيل الخروج',
              style: AppTextStyles.bold16.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
            const Spacer(),
            Icon(Icons.logout, color: AppColors.lightPrimaryColor),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
