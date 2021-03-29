import 'package:flutter/material.dart';
import 'package:lighthouse/components/warning_alert_dialog.dart';

void showAlertDialog(BuildContext context, String title, String content, Function cancelOnPressed, Function okOnPressed) async {
  String result = await showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return WarningAlertDialog(
          title: title,
          content: content,
          cancelOnPressed: cancelOnPressed,
          okOnPressed: okOnPressed,
      );
    },
  );
}