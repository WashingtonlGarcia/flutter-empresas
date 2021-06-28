import 'package:flutter/material.dart' show Route, RouteSettings, Widget;
import 'package:get/get.dart' show GetPageRoute, Bindings;

import 'app_route_name.dart';

class AppRoutes {
  static GetPageRoute _route({required RouteSettings settings, required Widget view, required Bindings binding, required String routeName}) {
    return GetPageRoute(page: () => view, routeName: routeName, binding: binding, settings: settings);
  }

  static Route onGenereteRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.companyDetail:

      case AppRouteName.home:

      case AppRouteName.login:
      default:
        throw 'not implemented!';
    }
  }
}
