import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String msg;
  final VoidCallback? onRetry; // optional
  final IconData icon;

  const CustomErrorWidget({
    super.key,
    required this.msg,
    this.onRetry,
    this.icon = Icons.error_outline,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 60, color: AppColors.primaryColor),

            const SizedBox(height: 16),

            Text(
              msg,
              textAlign: TextAlign.center,
              style: AppTextStyles.regular22.copyWith(
                color: AppColors.primaryColor,
              ),
            ),

            if (onRetry != null) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Retry"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
