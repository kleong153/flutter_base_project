import 'package:flutter/material.dart';
import 'package:flutter_base_project/constants/app_constants/app_constants.dart' as appConst;
import 'package:flutter_base_project/utils/scale_helper.dart';

mixin CommonElementMixin {
  Widget widgetSpacer({double multiplier = 1}) {
    return SizedBox(
      height: appConst.kDefaultPadding * multiplier,
      width: appConst.kDefaultPadding * multiplier,
    );
  }

  Widget textSpacer() {
    return const SizedBox(height: 4, width: 4);
  }

  TextStyle textStyle(
    ScaleHelper scaleHelper, {
    Color color = Colors.white,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      color: color,
      fontSize: scaleHelper.fontSize(fontSize),
      fontWeight: fontWeight,
    );
  }
}
