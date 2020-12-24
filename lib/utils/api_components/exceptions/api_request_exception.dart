import 'package:flutter_base_project/utils/api_components/exceptions/base/base_api_exception.dart';
import 'package:meta/meta.dart';

class ApiRequestException extends BaseApiException {
  ApiRequestException({
    @required String message,
  }) : super(message: message);
}
