import 'package:flutter/material.dart' show Route, RouteSettings, Widget;
import 'package:get/get.dart' show GetPageRoute, Bindings;

import '../modules/modules.dart';
import 'app_route_name.dart';

class AppRoutes {
  static GetPageRoute _route(
      {required RouteSettings settings,
      required Widget view,
      required Bindings binding,
      required String routeName}) {
    return GetPageRoute(
        page: () => view,
        routeName: routeName,
        binding: binding,
        settings: settings);
  }

  static Route onGenereteRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.enterpriseDetail:
        return _route(
            settings: settings,
            view: const EnterpriseDetailView(),
            binding: EnterpriseDetailBinding(),
            routeName: AppRouteName.enterpriseDetail);
      case AppRouteName.home:
        return _route(
            settings: settings,
            view: const HomeView(),
            binding: HomeBinding(),
            routeName: AppRouteName.home);
      case AppRouteName.login:
      default:
        return _route(
            routeName: AppRouteName.login,
            binding: LoginBinding(),
            settings: settings,
            view: const LoginView());
    }
  }
}
