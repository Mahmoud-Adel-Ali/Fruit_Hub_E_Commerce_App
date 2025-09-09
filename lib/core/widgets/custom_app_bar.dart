import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar customAppBar(
  BuildContext context, {
  required String title,
  bool showLeading = true,
}) {
  return AppBar(
    leading: showLeading
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          )
        : null,
    backgroundColor: Colors.white,
    flexibleSpace: Container(color: Colors.white),
    centerTitle: true,
    title: Text(title, style: AppTextStyles.bold19),
  );
}
