import 'package:flutter/material.dart';
import 'package:flutter_base_project/constants/app_constants/app_constants.dart' as appConst;
import 'package:flutter_base_project/generated/l10n.dart';

class AppProgressDialog {
  var _isDialogShowing = false;

  Future<void> showAsync({
    @required BuildContext context,
    String message,
  }) async {
    assert(context != null);

    if (!_isDialogShowing) {
      _isDialogShowing = true;

      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: ProgressDialogWidget(message: message),
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

class ProgressDialogWidget extends StatelessWidget {
  final String message;

  ProgressDialogWidget({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadingMessage = (message?.isEmpty ?? true ? Lang.of(context).loading : message);

    return SimpleDialog(
      contentPadding: const EdgeInsets.all(appConst.kDefaultDialogContentPadding),
      children: [
        Row(
          children: [
            CircularProgressIndicator(),
            const SizedBox(width: appConst.kDefaultPadding),
            Text(loadingMessage),
          ],
        ),
      ],
    );
  }
}
