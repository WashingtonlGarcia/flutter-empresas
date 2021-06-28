import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/http/http.dart' show HttpClientAuthetication;
import '../../data/models/enterprise.dart';
import '../../data/repositories/enterprise_repository.dart';
import '../../data/services/enterprise_service.dart';
import '../../themes/app_theme.dart';
import '../../utils/extensions/string/sanitize.dart';
import '../../utils/loading_controller.dart';
import '../../utils/mixins/mixin_keyboard.dart';
import '../../utils/mixins/mixin_scrool_controller.dart';

class HomeController extends GetxController
    with MixinScrollController, MixinKeybordUtil, MixinTheme {
  late EnterpriseRepository _enterpriseRepository;

  final RxList<Enterprise> _enterprises = <Enterprise>[].obs;

  final RxList<Enterprise> _enterprisesSearch = <Enterprise>[].obs;

  set enterprisesSearch(List<Enterprise> items) =>
      _enterprisesSearch.assignAll(items);

  List<Enterprise> get enterprisesSearch => _enterprisesSearch;

  final LoadingController loading = LoadingController();

  set enterprises(List<Enterprise> items) => _enterprises.assignAll(items);

  List<Enterprise> get enterprises => _enterprises;

  final RxString _search = ''.obs;

  String get search => _search.value;

  set search(String value) => _search.value = value;

  Future<void> initEnterprises() async {
    final List<Enterprise>? enterprises = await _enterpriseRepository.getAll();
    if (enterprises != null && enterprises.isNotEmpty) {
      this.enterprises = enterprises;
      enterprisesSearch = enterprises;
    }
  }

  void _searchDebouce() {
    debounce(_search, (String value) {
      enterprisesSearch = searchEnterprises(search: value);
    }, time: const Duration(milliseconds: 500));
  }

  List<Enterprise> searchEnterprises({required String search}) {
    if (search.isEmpty) return enterprises;
    return enterprises
        .where((Enterprise enterprise) =>
            enterprise.enterpriseName.matches(search))
        .toList();
  }

  Future<void> onSetup() async {
    try {
      loading.onChanged();
      final HttpClientAuthetication httpAuthetication =
          Get.arguments as HttpClientAuthetication;
      _enterpriseRepository = EnterpriseRepository(
          service: EnterpriseService(httpAuthetication: httpAuthetication));
      await initEnterprises();
      onScrollInit();
      _searchDebouce();
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
    onSetup();
    super.onInit();
  }

  @override
  void dispose() {
    onScrollDispose();
    super.dispose();
  }
}
