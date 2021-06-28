import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_theme.dart';
import 'enterprise_detail_controller.dart';
import 'widgets/widgets.dart';

class EnterpriseDetailView extends GetView<EnterpriseDetailController> with MixinTheme {
  const EnterpriseDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: controller.enterprise.enterpriseName),
      body: ListView(
        children: [
          ListTileEnterpriseWidget.noOnTap(enterprise: controller.enterprise),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(controller.enterprise.description, style: theme.fonts.headline7Black),
          ),
        ],
      ),
    );
  }
}
