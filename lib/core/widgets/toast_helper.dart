import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_colors.dart';

class ToastHelper {
  //* Show Success Toast
  static void showSuccessToast(String message) {
    closeToast();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.primaryColor,
      textColor: AppColors.white,
      fontSize: 16.0,
    );
  }

  //* Show Error Toast
  static void showErrorToast(String message) {
    closeToast();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.red,
      textColor: AppColors.white,
      fontSize: 16.0,
    );
  }

  //* Close Toast
  static void closeToast() => Fluttertoast.cancel();
}
