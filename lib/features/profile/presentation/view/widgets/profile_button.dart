import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.title,
    this.subtitle = "",
    required this.svg,
    this.trailing,
    this.onTap,
  });
  final String title, subtitle, svg;
  final VoidCallback? onTap;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.grey.shade300, width: 1),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
              child: Row(
                children: [
                  SvgPicture.asset(svg),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: AppTextStyles.bold13.copyWith(
                      color: AppColors.grey.shade800,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              subtitle,
              style: AppTextStyles.bold13.copyWith(
                color: AppColors.grey.shade800,
              ),
            ),
            if (trailing != null)
              FittedBox(fit: BoxFit.scaleDown, child: trailing!)
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
          ],
        ),
      ),
    );
  }
}
