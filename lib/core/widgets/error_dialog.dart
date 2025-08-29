import 'package:flutter/material.dart';

import '../widgets/custom_message_dialog.dart';

Future<dynamic> errorDialog(BuildContext context, {required String msg}) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomMessageDialog(title: 'خطأ', description: msg);
    },
  );
}
