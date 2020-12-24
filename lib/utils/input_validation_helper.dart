import 'package:flutter_base_project/generated/l10n.dart';

class InputValidationHelper {
  String requiredField(String value, {bool trim = false}) {
    final val = (trim ? value.trim() : value);

    if (val.isEmpty) {
      return Lang.current.required_field;
    }

    return null;
  }

  String requiredDateTimeField(DateTime value) {
    if (value == null) {
      return Lang.current.required_field;
    }

    return null;
  }

  String integerField(String value, {bool required = true}) {
    if (required && value.isEmpty) {
      return Lang.current.required_field;
    } else if (!required && value.isEmpty) {
      // Optional.
      return null;
    }

    if (int.tryParse(value) == null) {
      return Lang.current.only_accept_integer;
    }

    return null;
  }

  String numericField(String value, {bool required = true}) {
    if (required && value.isEmpty) {
      return Lang.current.required_field;
    } else if (!required && value.isEmpty) {
      // Optional.
      return null;
    }

    if (double.tryParse(value) == null) {
      return Lang.current.only_accept_numeric;
    }

    return null;
  }
}
