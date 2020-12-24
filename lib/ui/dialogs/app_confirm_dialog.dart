import 'package:flutter/material.dart';
import 'package:flutter_base_project/constants/app_constants/app_constants.dart' as appConst;
import 'package:flutter_base_project/generated/l10n.dart';

enum AppConfirmDialogOption {
  yes,
  no,
}

class AppConfirmDialog {
  var _isDialogShowing = false;

  Future<void> showAsync({
    @required BuildContext context,
    String title,
    String message,
    bool barrierDismissible = true,
    String yesButtonText,
    String noButtonText,
    void Function(AppConfirmDialogOption option) onButtonPressed,
  }) async {
    assert(context != null);

    if (!_isDialogShowing) {
      _isDialogShowing = true;

      Widget textTitle = (title != null && title.isNotEmpty ? Text(title) : null);
      var yesText = yesButtonText;
      var noText = noButtonText;

      final lang = Lang.of(context);

      if (yesText?.isEmpty ?? true) {
        yesText = lang.yes;
      }

      if (noText?.isEmpty ?? true) {
        noText = lang.cancel;
      }

      await showDialog<void>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return AlertDialog(
            title: textTitle,
            content: Text(message),
            actions: [
              FlatButton(
                onPressed: () {
                  if (_isDialogShowing) {
                    dismiss(context);
                  }

                  if (onButtonPressed != null) {
                    onButtonPressed(AppConfirmDialogOption.no);
                  }
                },
                child: Text(
                  noText,
                  style: TextStyle(
                    color: appConst.kTextDangerColor,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  if (_isDialogShowing) {
                    dismiss(context);
                  }

                  if (onButtonPressed != null) {
                    onButtonPressed(AppConfirmDialogOption.yes);
                  }
                },
                child: Text(yesText),
              ),
            ],
          );
        },
      );

      _isDialogShowing = false;
    }
  }

  void dismiss(BuildContext context) {
    if (_isDialogShowing) {
      _isDialogShowing = false;

      Navigator.of(context).pop();
    }
  }
}
