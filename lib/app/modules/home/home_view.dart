import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/enterprise.dart';
import '../../routes/app_route_name.dart';
import '../../themes/app_theme.dart';
import 'home_controller.dart';
import 'widgets/widgets.dart';

class HomeView extends GetView<HomeController> with MixinTheme {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: theme.colors.background,
        appBar: HeaderWidget(
          input: InputWidget.search(
            hintText: 'Pesquise por empresa',
            textInputType: TextInputType.text,
            enabled: true,
            onChanged: (value) => controller.search = value,
          ),
          context: context,
          isOpenKeyboardOrScroll: !controller.isScrolledToTop || !controller.isKeyboardOpen,
        ),
        body: Visibility(
          visible: !controller.loading.value,
          replacement: const Center(
            child: LoadingWidget(),
          ),
          child: Visibility(
            visible: controller.enterprisesSearch.isNotEmpty,
            replacement: Center(
              child: Text(
                'Nenhum resultado encontrado',
                style: theme.fonts.headline7Gray,
              ),
            ),
            child: ListView.separated(
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: controller.enterprisesSearch.length + 1,
                itemBuilder: (context, index) {
                  final List<Enterprise> enterprises = controller.enterprisesSearch;
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text('${enterprises.length} resultados encontrados', style: theme.fonts.body2),
                    );
                  }
                  return ListTileEnterpriseWidget(
                      enterprise: enterprises[index - 1], onTap: () => Get.toNamed(AppRouteName.enterpriseDetail, arguments: enterprises[index - 1]));
                }),
          ),
        ),
      ),
    );
  }
}
