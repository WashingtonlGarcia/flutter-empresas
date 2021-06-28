import 'package:flutter/material.dart'
    show Key, BuildContext, Widget, StatelessWidget;
import 'package:get/get.dart' show GetMaterialApp;

import 'app/routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      onGenerateRoute: AppRoutes.onGenereteRoute,
    );
  }
}
