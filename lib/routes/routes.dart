import 'package:flutter/material.dart';
import 'package:practice/screens/home.dart';
import 'package:practice/screens/personal.dart';

import '../screens/widgets.dart';

/// This is an enumeration that represents different routes in the application.
enum Location {
  home,
  personal,
  widgets,
}

/// It provides a getter `path` that returns a `String` representation of the route.
extension RoutesExtension on Location {
  static const String fallback = '/';

  /// Returns a `String` representation of the route.
  String get path {
    var route = _routeMap[this];
    if (route == null) return fallback;
    return route;
  }
}

///
Route<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => const HomePage(),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      );
    case '/personal':
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => const PersonalPage(),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      );
    case '/widgets':
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => WidgetPage(),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      );
  }

  // Unknown route
  return MaterialPageRoute(builder: (_) => const HomePage());
}

/// This is a `Map` that maps `Location` enum to `String` representation of the route.
const _routeMap = {
  Location.home: '/',
  Location.personal: '/personal',
  Location.widgets: '/widgets',
};

/// This is the map of routes that the application will use.
final _routes = <String, WidgetBuilder>{
  // '/': (context) => const HomePage(),
  // '/personal': (context) => const PersonalPage(),
  // '/widgets': (context) => WidgetPage(),
};

Map<String, WidgetBuilder> getRoutes() => _routes;
