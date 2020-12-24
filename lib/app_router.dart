import 'package:flutter/material.dart';

class AppRouter {
  static const splashScreen = '/';
  static const login = '/login';
  static const home = '/home';

  static Route<dynamic> generatedRoute(RouteSettings settings) => _materialPageRoute(_getWidgetByRouteName(settings.name, settings));

  static Widget _getWidgetByRouteName(String routeName, RouteSettings settings) {
    Widget widget;

    switch (routeName) {
      case splashScreen:
      // widget = SplashScreen();
      // break;
      case login:
      // widget = LoginScreen();
      // break;
      case home:
      // widget = HomeScreen();
      // break;
      default:
        throw UnimplementedError('Unimplemented route: $routeName');
    }

    return widget;
  }

  static MaterialPageRoute _materialPageRoute(Widget widget) => MaterialPageRoute(builder: (_) => widget);
}
