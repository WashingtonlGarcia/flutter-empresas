import 'package:flutter/cupertino.dart' show MediaQuery;
import 'package:get/get.dart';

mixin MixinKeybordUtil on GetxController {
  bool get isKeyboardOpen => !(MediaQuery.of(Get.context!).viewInsets.bottom > 0.0);
}
