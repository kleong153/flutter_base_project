import 'package:flutter/material.dart';

class ScaleHelper {
  double _widgetSizeScale;
  double _textSizeScale;

  ScaleHelper(MediaQueryData mediaQueryData) {
    if (mediaQueryData.size.width <= 320) {
      _widgetSizeScale = 0.8;
      _textSizeScale = 0.8 * mediaQueryData.textScaleFactor;
    } else if (mediaQueryData.size.width <= 360) {
      _widgetSizeScale = 0.9;
      _textSizeScale = 0.9 * mediaQueryData.textScaleFactor;
    } else {
      _widgetSizeScale = 1;
      _textSizeScale = mediaQueryData.textScaleFactor;
    }
  }

  double widgetSize(double paddingSize) => paddingSize * _widgetSizeScale;

  double fontSize(double fontSize) => fontSize * _textSizeScale;
}
