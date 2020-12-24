import 'package:flutter_base_project/utils/api_components/exceptions/base/base_api_exception.dart';
import 'package:meta/meta.dart';

class UnauthenticatedException extends BaseApiException {
  UnauthenticatedException({
    @required String message,
  }) : super(message: message);
}
