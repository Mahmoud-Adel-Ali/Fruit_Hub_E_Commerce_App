import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';
import 'custom_button.dart';

enum MessageType { success, error }

class CustomMessageDialog extends StatelessWidget {
  const CustomMessageDialog({
    super.key,
    required this.title,
    required this.description,
    this.type = MessageType.error,
    this.onOkPressed,
    this.showCelebration = false,
  });

  final String title;
  final String description;
  final MessageType type;
  final VoidCallback? onOkPressed;
  final bool showCelebration;

  @override
  Widget build(BuildContext context) {
    final isSuccess = type == MessageType.success;
    final animation = isSuccess
        ? Assets.animationsSuccess
        : Assets.animationsError;

    return Stack(
      children: [
        if (isSuccess && showCelebration)
          Lottie.asset(Assets.animationsCongratsLottie),
        Dialog(
          backgroundColor: AppColors.white,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 50,
                  child: FittedBox(
                    child: Lottie.asset(animation, repeat: false),
                  ),
                ),
                Text(
                  title,
                  style: AppTextStyles.bold19.copyWith(
                    color: isSuccess ? AppColors.green : AppColors.red,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.regular16,
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42.0),
                  child: CustomButton(
                    text: 'حسنا',
                    color: isSuccess ? AppColors.primaryColor : AppColors.red,
                    onPressed: onOkPressed ?? () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
