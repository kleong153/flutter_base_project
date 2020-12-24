import 'package:flutter/material.dart';
import 'package:flutter_base_project/app_router.dart';
import 'package:flutter_base_project/generated/l10n.dart';
import 'package:flutter_base_project/ui/dialogs/app_alert_dialog.dart';
import 'package:flutter_base_project/ui/dialogs/app_progress_dialog.dart';
import 'package:flutter_base_project/utils/api_components/api_components.dart';
import 'package:flutter_base_project/utils/auth_helper.dart';

abstract class BaseScreenState<T extends StatefulWidget> extends State<T> {
  final _appProgressDialog = AppProgressDialog();
  final _appAlertDialog = AppAlertDialog();
  var _isAuthenticateRequired = true;

  void setIsAuthenticateRequired(bool value) => _isAuthenticateRequired = value;

  void setScreenIsLoading({
    @required bool isLoading,
    String message,
  }) {
    assert(isLoading != null);

    if (isLoading) {
      // Dismiss other dialogs.
      _appAlertDialog.dismiss(context);

      _appProgressDialog.showAsync(context: context, message: message);
    } else {
      _appProgressDialog.dismiss(context);
    }
  }

  void showAlertTextWithStatusDialog({
    @required AppAlertDialogStatus status,
    @required String message,
    String title,
    bool barrierDismissible = true,
    void Function() onDialogDismissed,
  }) {
    assert(status != null);
    assert(message != null);

    // Dismiss other dialogs.
    _appProgressDialog.dismiss(context);
    _appAlertDialog.dismiss(context);

    _appAlertDialog.showAsync(
      context: context,
      status: status,
      message: message,
      title: title,
      barrierDismissible: barrierDismissible,
    ).then((value) {
      if (onDialogDismissed != null) {
        onDialogDismissed();
      }
    });
  }

  bool reportException(ex, {bool showErrorDialog = false}) {
    if (!mounted) {
      // Screen is gone, ignore.
      return true;
    }

    if (ex is UnauthenticatedException) {
      if (_isAuthenticateRequired) {
        // Dismiss other dialogs.
        _appProgressDialog.dismiss(context);
        _appAlertDialog.dismiss(context);

        _appAlertDialog.showAsync(
          context: context,
          status: AppAlertDialogStatus.error,
          message: Lang.current.please_login,
          barrierDismissible: false,
        ).then((value) {
          AuthHelper().logoutAsync().then((value) {
            Navigator.of(context).pushNamedAndRemoveUntil(AppRouter.login, (route) => false);
          });
        });
      }

      return true;
    } else if (ex is ValidationFailException || ex is InternalServerException) {
      if (showErrorDialog) {
        // Dismiss other dialogs.
        _appProgressDialog.dismiss(context);
        _appAlertDialog.dismiss(context);

        _appAlertDialog.showAsync(
          context: context,
          status: AppAlertDialogStatus.error,
          message: (ex as BaseApiException).message,
        );

        return true;
      }
    }

    return false;
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
