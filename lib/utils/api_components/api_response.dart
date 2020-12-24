import 'package:flutter_base_project/generated/l10n.dart';
import 'package:flutter_base_project/utils/api_components/exceptions/base/base_api_exception.dart';
import 'package:meta/meta.dart';

enum ApiResponseStatus {
  success,
  error,
}

class ApiResponse<T> {
  ApiResponseStatus status;
  String message;
  T data;
  dynamic exception;

  ApiResponse({
    @required this.status,
    this.message = '',
    this.data,
  }) : assert(status != null);

  ApiResponse.defaultError()
      : this.status = ApiResponseStatus.error,
        this.message = Lang.current.request_error_please_retry;

  void setExceptionAndMessage(dynamic ex) {
    exception = ex;

    if (ex != null && ex is BaseApiException) {
      message = _exceptionMessageOrDefault(ex.message);
    }
  }

  String _exceptionMessageOrDefault(String msg) {
    if (msg?.isEmpty ?? true) {
      return message;
    } else {
      return msg;
    }
  }
}
