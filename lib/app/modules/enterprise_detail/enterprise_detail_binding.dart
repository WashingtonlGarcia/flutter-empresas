import 'package:get/get.dart';

import 'enterprise_detail_controller.dart';

class EnterpriseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterpriseDetailController());
  }

}
