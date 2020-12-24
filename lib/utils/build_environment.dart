import 'package:meta/meta.dart';

BuildEnvironment get env => _env;
BuildEnvironment _env;

class BuildEnvironment {
  final String baseUrl;
  final String defaultApiLocale;

  BuildEnvironment._init({
    @required this.baseUrl,
    this.defaultApiLocale,
  })  : assert(baseUrl != null),
        assert(defaultApiLocale != null);

  static void init({
    @required String baseUrl,
    String defaultApiLocale = 'en',
  }) {
    _env ??= BuildEnvironment._init(
      baseUrl: baseUrl,
      defaultApiLocale: defaultApiLocale,
    );
  }
}
