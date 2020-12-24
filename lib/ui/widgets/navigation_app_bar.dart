import 'package:flutter/material.dart';
import 'package:flutter_base_project/constants/app_constants/app_constants.dart' as appConst;
import 'package:flutter_base_project/generated/l10n.dart';

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final Color backButtonColor;
  final Color backButtonBackgroundColor;
  final Brightness brightness;
  final void Function() onBackButtonPressed;

  final double _toolbarHeight;

  const NavigationAppBar({
    Key key,
    @required this.title,
    this.textColor,
    this.backgroundColor,
    this.backButtonColor,
    this.backButtonBackgroundColor,
    this.brightness,
    this.onBackButtonPressed,
  })  : assert(title != null),
        this._toolbarHeight = kToolbarHeight,
        super(key: key);

  const NavigationAppBar.invisible({
    Key key,
    this.brightness,
  })  : this.title = '',
        _toolbarHeight = 0,
        this.textColor = null,
        this.backgroundColor = null,
        this.backButtonColor = null,
        this.backButtonBackgroundColor = null,
        this.onBackButtonPressed = null,
        super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(_toolbarHeight);

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);

    return AppBar(
      leading: _backButton(lang),
      brightness: (brightness ?? Brightness.dark),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
      backgroundColor: backgroundColor,
      elevation: 0,
    );
  }

  Widget _backButton(Lang lang) {
    if (onBackButtonPressed != null) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Tooltip(
          message: lang.back,
          child: TextButton(
            onPressed: () {
              if (onBackButtonPressed != null) {
                onBackButtonPressed();
              }
            },
            child: const Icon(Icons.arrow_back),
            style: TextButton.styleFrom(
              primary: (backButtonColor ?? appConst.kAppBarTextColor),
              shape: const CircleBorder(),
              backgroundColor: backButtonBackgroundColor,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      );
    }

    // Do not return any widgets as it will take come space on leading container.
    return null;
  }
}
