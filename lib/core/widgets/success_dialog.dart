import 'package:flutter/material.dart';

import '../widgets/custom_message_dialog.dart';

Future<dynamic> successDialog(
  BuildContext context, {
  required String msg,
  bool showCelebration = true,
  Function()? onOkPressed,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomMessageDialog(
        title: 'تم',
        description: msg,
        showCelebration: showCelebration,
        type: MessageType.success,
        onOkPressed: onOkPressed,
      );
    },
  );
}
