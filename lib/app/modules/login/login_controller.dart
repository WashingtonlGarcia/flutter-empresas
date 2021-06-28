import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/http/http.dart' show HttpClientAuthetication;
import '../../data/repositories/auth_repository.dart';
import '../../routes/app_route_name.dart';
import '../../themes/app_theme.dart';
import '../../utils/loading_controller.dart';
import '../../utils/mixins/mixin_keyboard.dart';
import '../../utils/mixins/mixin_scrool_controller.dart';

class LoginController extends GetxController
    with MixinScrollController, MixinKeybordUtil, MixinTheme {
  final AuthRepository _authRepository;

  LoginController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  late LoadingController loading;

  final RxBool _isObscure = false.obs;

  bool get isObscure => _isObscure.value;

  void onChangedObscure() {
    _isObscure.value = !_isObscure.value;
  }

  final Rx<UserAuth> _userAuth = UserAuth(email: '', password: '').obs;

  UserAuth get userAuth => _userAuth.value;

  set userAuth(UserAuth value) => _userAuth.value = value;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePassword = FocusNode();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'E-mail é obrigatório!';
    if (!value.isEmail) return 'E-mail está incorreto!';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Senha é obrigatório!';
    return null;
  }

  void onSubmitEmail() {
    if (FocusScope.of(Get.context!).hasFocus) {
      FocusScope.of(Get.context!).unfocus();
    }
    FocusScope.of(Get.context!).requestFocus(focusNodePassword);
  }

  Future<void> onSubmitPassword() async {
    if (FocusScope.of(Get.context!).hasFocus) {
      FocusScope.of(Get.context!).unfocus();
    }
    await signIn();
  }

  Future<void> signIn() async {
    try {
      loading.onChanged();
      if (formKey.currentState!.validate()) {
        final HttpClientAuthetication httpAuthetication =
            await _authRepository.signIn(userAuth: userAuth);
        Get.toNamed(AppRouteName.home, arguments: httpAuthetication);
      }
    } catch (error) {
      Get.showSnackbar(GetBar(
        backgroundColor: theme.colors.error,
        duration: const Duration(seconds: 5),
        message: error.toString(),
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
      ));
    } finally {
      loading.onChanged();
    }
  }

  @override
  void onInit() {
    loading = LoadingController();
    onScrollInit();
    super.onInit();
  }

  @override
  void dispose() {
    onScrollDispose();
    super.dispose();
  }
}
