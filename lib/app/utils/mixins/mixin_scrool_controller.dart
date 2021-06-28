import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/get_rx.dart';

mixin MixinScrollController {
  final double _emptySpace = 0.0;
  final RxBool _isScrolledToTop = true.obs;
  final Rx<ScrollController> _scrollControlller = ScrollController().obs;

  bool get isScrolledToTop => _isScrolledToTop.value;

  set isScrolledToTop(bool value) => _isScrolledToTop.value = value;

  ScrollController get scrollController => _scrollControlller.value;

  void _handleObserverScrolled() {
    if (scrollController.offset <= scrollController.position.minScrollExtent && !scrollController.position.outOfRange) {
      if (!isScrolledToTop) {
        isScrolledToTop = true;
      }
    } else {
      if (scrollController.offset > _emptySpace && isScrolledToTop) {
        isScrolledToTop = false;
      }
    }
  }

  void onScrollInit() {
    scrollController.addListener(_handleObserverScrolled);
  }

  void onScrollDispose() {
    scrollController.dispose();
  }
}
