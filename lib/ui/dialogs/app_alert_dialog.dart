import 'package:flutter/material.dart';
import 'package:flutter_base_project/constants/app_constants/app_constants.dart' as appConst;
import 'package:flutter_base_project/generated/l10n.dart';

enum AppAlertDialogStatus {
  success,
  error,
  info,
}

class AppAlertDialog {
  var _isDialogShowing = false;

  Future<void> showAsync({
    @required BuildContext context,
    @required AppAlertDialogStatus status,
    @required String message,
    String title,
    bool barrierDismissible = true,
    String okButtonText,
  }) async {
    assert(context != null);
    assert(status != null);
    assert(message != null);

    if (!_isDialogShowing) {
      _isDialogShowing = true;

      final lang = Lang.of(context);
      var okText = okButtonText;

      if (okText?.isEmpty ?? true) {
        okText = lang.ok;
      }

      await showDialog<void>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            title: _title(status, title, lang),
            content: Text(message),
            actions: [
              FlatButton(
                onPressed: () {
                  if (_isDialogShowing) {
                    dismiss(context);
                  }
                },
                child: Text(okText),
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

  Widget _title(AppAlertDialogStatus status, String title, Lang lang) {
    switch (status) {
      case AppAlertDialogStatus.success:
        return _titleWithIcon(
          Icons.check_circle_outline_outlined,
          (title ?? lang.success),
          appConst.kTextSuccessColor,
        );
      case AppAlertDialogStatus.error:
        return _titleWithIcon(
          Icons.cancel_outlined,
          (title ?? lang.oops),
          appConst.kTextDangerColor,
        );
      case AppAlertDialogStatus.info:
        return _titleWithIcon(
          Icons.info_outlined,
          (title ?? lang.info),
          appConst.kTextInfoColor,
        );
      default:
        if (title != null) {
          return Text(title);
        }
    }

    return null;
  }

  Widget _titleWithIcon(IconData icon, String title, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 26,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
