import 'package:meta/meta.dart';

abstract class BaseApiException {
  final String message;

  BaseApiException({
    @required this.message,
  }) : assert(message != null);

  @override
  String toString() => message;
}
