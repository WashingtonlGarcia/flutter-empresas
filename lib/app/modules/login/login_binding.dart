import 'package:get/get.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/services/auth_service.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
        authRepository: AuthRepository(service: AuthService())));
  }
}
