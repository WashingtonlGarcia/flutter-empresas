import 'package:get/get.dart';

class LoadingController {
  final RxBool _value;

  LoadingController() : _value = false.obs;

  void onChanged() {
    _value.value = !_value.value;
  }

  bool get value => _value.value;
}
