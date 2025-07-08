import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

customAppBar(BuildContext context, {required String title}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
      onPressed: () => Navigator.pop(context),
    ),
    backgroundColor: Colors.white,
    flexibleSpace: Container(color: Colors.white),
    centerTitle: true,
    title: Text(title, style: AppTextStyles.bold19),
  );
}
