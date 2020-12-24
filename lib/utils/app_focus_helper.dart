import 'package:flutter/material.dart';

class AppFocusHelper {
  static final AppFocusHelper _instance = AppFocusHelper._privateConstructor();

  static AppFocusHelper get instance => _instance;

  AppFocusHelper._privateConstructor();

  void requestUnfocus() => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}
