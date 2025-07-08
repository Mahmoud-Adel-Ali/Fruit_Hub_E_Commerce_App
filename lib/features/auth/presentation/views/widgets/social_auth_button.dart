import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.icon,
  });
  final Function()? onPressed;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.white,
      minWidth: MediaQuery.sizeOf(context).width,
      height: 54,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          const Spacer(),
          Text(text, style: AppTextStyles.bold16),
          const Spacer(),
        ],
      ),
    );
  }
}
