import 'package:flutter/material.dart';
import 'package:flutter_base_project/constants/app_constants/app_constants.dart' as appConst;

mixin FormInputFieldMixin {
  OutlineInputBorder inputDecorationBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(30),
    );
  }

  OutlineInputBorder errorInputDecorationBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.redAccent,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(30),
    );
  }

  OutlineInputBorder focusedInputDecorationBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: appConst.kPrimaryColor,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(30),
    );
  }
}
