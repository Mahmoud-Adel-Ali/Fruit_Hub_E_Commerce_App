import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../utils/app_colors.dart';

class CustomProgressHub extends StatelessWidget {
  const CustomProgressHub({
    super.key,
    required this.isLoading,
    required this.child,
  });
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
      inAsyncCall: isLoading,
      child: child,
    );
  }
}
