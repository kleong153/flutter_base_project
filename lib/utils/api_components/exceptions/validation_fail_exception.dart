import 'package:flutter_base_project/utils/api_components/exceptions/base/base_api_exception.dart';
import 'package:meta/meta.dart';

class ValidationFailException extends BaseApiException {
  final Map<String, String> errors;

  ValidationFailException({
    @required String message,
    this.errors,
  }) : super(message: message);
}
