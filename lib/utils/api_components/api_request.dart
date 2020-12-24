import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_base_project/generated/l10n.dart';
import 'package:flutter_base_project/utils/api_components/api_components.dart';
import 'package:flutter_base_project/utils/build_environment.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:meta/meta.dart';

enum RequestMethod {
  get,
  post,
}

class ApiRequest {
  Future<ApiResponse> requestAsync({
    @required RequestMethod requestMethod,
    @required String url,
    Map<String, dynamic> requestBody,
    int timeout = 10000,
    ResponseType responseType,
  }) async {
    try {
      final requestBodyData = (requestBody == null ? null : jsonEncode(requestBody));

      return await _requestAsync(
        url: url,
        requestBodyData: requestBodyData,
        timeout: timeout,
        responseType: responseType,
        requestMethod: requestMethod,
      );
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<ApiResponse> postFormDataAsync({
    @required String url,
    FormData formData,
    int timeout = 10000,
  }) async {
    try {
      return await _requestAsync(
        url: url,
        requestBodyData: formData,
        timeout: timeout,
        requestMethod: RequestMethod.post,
      );
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<ApiResponse> _requestAsync({
    @required RequestMethod requestMethod,
    @required String url,
    dynamic requestBodyData,
    int timeout = 10000,
    ResponseType responseType,
  }) async {
    assert(requestMethod != null);
    assert(url != null && url.isNotEmpty);
    assert(timeout > 0);

    final lang = Lang.current;
    final requestUrl = env.baseUrl + url;

    try {
      final accessToken = '';

      final dio = Dio();
      dio.options.headers = _getJsonRequestHeaders(accessToken);
      dio.options.connectTimeout = timeout;
      dio.options.sendTimeout = timeout;
      dio.options.receiveTimeout = timeout;
      dio.options.responseType = responseType;

      // Set request method AFTER check & refresh access token.
      switch (requestMethod) {
        case RequestMethod.get:
          dio.options.method = 'GET';
          break;
        case RequestMethod.post:
          dio.options.method = 'POST';
          break;
        default:
          throw UnimplementedError('Unknown request method: $requestMethod');
      }

      Fimber.d('d;;postUrl: $requestUrl');
      Fimber.d('d;;requestHeaders: ${dio.options.headers}');
      Fimber.d('d;;requestBody: $requestBodyData');

      final response = await dio.request(requestUrl, data: requestBodyData);

      Fimber.d('d;;response status code: ${response.statusCode}');

      if (responseType == ResponseType.bytes) {
        return ApiResponse(
          status: ApiResponseStatus.success,
          message: '',
          data: response,
        );
      } else {
        Fimber.d('d;;response: ${response.data}');

        final resMessage = response.data['message'] ?? '';
        final resData = response.data['data'];

        return ApiResponse(
          status: ApiResponseStatus.success,
          message: resMessage,
          data: resData,
        );
      }
    } on DioError catch (ex) {
      Fimber.e('d;;DioError exception', ex: ex);

      final httpStatusCode = ex.response?.statusCode;

      if (httpStatusCode != null) {
        final response = ex.response;
        final resMessage = '${response.data['message'] ?? ''}'.replaceAll('\\n', '\n');

        if (httpStatusCode == 500) {
          return Future.error(InternalServerException(
            message: resMessage,
          ));
        } else if (httpStatusCode == 422) {
          // Validation fail.
          Map<String, String> errors = {
            '': resMessage,
          };

          return Future.error(ValidationFailException(
            message: resMessage,
            errors: errors,
          ));
        } else if (httpStatusCode == 401) {
          return Future.error(UnauthenticatedException(
            message: (resMessage.isNotEmpty ? resMessage : lang.please_login),
          ));
        } else if (resMessage?.isNotEmpty ?? false) {
          // Has response message, return with given message.
          return Future.error(_apiRequestException(resMessage));
        }
      }

      return Future.error(_apiRequestException(lang.cannot_connect_to_server_please_retry));
    } on UnimplementedError catch (ex) {
      throw ex;
    } catch (ex) {
      Fimber.e('d;;exception', ex: ex);

      return Future.error(_apiRequestException(lang.cannot_connect_to_server_please_retry));
    }
  }

  Map<String, String> _getJsonRequestHeaders(String accessToken, {language = 'en'}) {
    final headers = {
      'Content-Language': language,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (accessToken?.isNotEmpty ?? false) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    return headers;
  }

  ApiRequestException _apiRequestException(String message) {
    return ApiRequestException(message: message);
  }
}
