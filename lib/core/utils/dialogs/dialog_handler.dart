import 'package:flutter/material.dart';

import 'custom_dialog.dart';
import 'custom_yes_no_dialog.dart';

enum TypeDialog { none, success, error }

class DialogHandler {
  static Future<void> showCustomDialog(
    BuildContext context, {
    required String title,
    String? message,
    String textButton = 'Close',
    VoidCallback? onTap,
    bool barrierDismissible = true,
    bool closeButton = true,
    TypeDialog type = TypeDialog.none,
  }) async {
    await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (_) {
          return WillPopScope(
            onWillPop: () async {
              if (barrierDismissible) {
                Navigator.of(context, rootNavigator: true).pop();
              }
              return false;
            },
            child: CustomDialog(
              title: title,
              message: message,
              textButton: textButton,
              onTap: onTap,
              type: type,
              closeButton: closeButton,
            ),
          );
        });
  }

  static Future<bool?> showCustomYesNoDialog(
    BuildContext context, {
    String? message,
    required String title,
    String textAdverse = 'No',
    String textAssertive = 'Yes',
    VoidCallback? onTapNo,
    VoidCallback? onTapYes,
    bool barrierDismissible = true,
    int flexAdverse = 1,
    int flexAssertive = 1,
    bool isDangerButton = false,
    TypeDialog type = TypeDialog.none,
  }) async {
    final result = await showDialog<bool>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (_) {
          return WillPopScope(
            onWillPop: () async {
              if (barrierDismissible) {
                Navigator.of(context, rootNavigator: true).pop();
              }
              return false;
            },
            child: CustomYesNoDialog(
              title: title,
              message: message,
              onTapYes: onTapYes,
              onTapNo: onTapNo,
              textAdverse: textAdverse,
              textAssertive: textAssertive,
              flexAdverse: flexAdverse,
              flexAssertive: flexAssertive,
              isDangerButton: isDangerButton,
              type: type,
            ),
          );
        });
    return result;
  }
}
