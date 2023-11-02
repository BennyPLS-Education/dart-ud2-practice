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

  String get path {
    var route = _routeMap[this];
    if (route == null) return fallback;
    return route;
  }
}

/// This is a `Map` that maps `Location` enum to `String` representation of the route.
const _routeMap = {
  Location.home: '/',
  Location.personal: '/personal',
  Location.widgets: '/widgets',
};

/// This is the map of routes that the application will use.
final _routes = {
  '/': (context) => const HomePage(),
  '/personal': (context) => const PersonalPage(),
  '/widgets': (context) => WidgetPage(),
};

Map<String, WidgetBuilder> getRoutes() => _routes;
