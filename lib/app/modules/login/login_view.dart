import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_theme.dart';
import 'login_controller.dart';
import 'widgets/widgets.dart';

class LoginView extends GetView<LoginController> with MixinTheme {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(children: [
          Scaffold(
            backgroundColor: theme.colors.background,
            appBar: HeaderWidget(
                context: context, isKeyboardOpen: controller.isKeyboardOpen),
            body: Form(
              key: controller.formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                controller: controller.scrollController,
                children: [
                  InputTileWidget(
                      placerHolder: 'Email',
                      input: InputWidget.mail(
                          validator: controller.validateEmail,
                          focusNode: controller.focusNodeEmail,
                          textInputType: TextInputType.emailAddress,
                          enabled: !controller.loading.value,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: controller.onSubmitEmail,
                          onChanged: (value) =>
                              controller.userAuth.email = value)),
                  const SizedBox(height: 16),
                  InputTileWidget(
                      placerHolder: 'Senha',
                      input: InputWidget.password(
                          obscureOnTap: controller.onChangedObscure,
                          obscureText: !controller.isObscure,
                          validator: controller.validatePassword,
                          focusNode: controller.focusNodePassword,
                          textInputType: TextInputType.emailAddress,
                          enabled: !controller.loading.value,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: controller.onSubmitPassword,
                          onChanged: (value) =>
                              controller.userAuth.password = value)),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ButtonWidget(
                        title: 'ENTRAR',
                        onTap: () => controller.onSubmitPassword()),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: controller.loading.value,
            child: Container(
              height: Get.height,
              width: Get.width,
              color: Colors.black54,
              child: const Center(
                child: LoadingWidget(),
              ),
            ),
          )
        ]));
  }
}
