import 'dart:math';

import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class LoadingWidget extends StatelessWidget with MixinTheme {
  const LoadingWidget({Key? key}) : super(key: key);

  Widget _circularProgressWidget({required double width, required double height}) => Center(
        child: SizedBox(
          width: width,
          height: height,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(theme.colors.secondary),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: Stack(
        children: [
          _circularProgressWidget(width: 72, height: 72),
          Transform.rotate(angle: pi * -1, child: _circularProgressWidget(width: 47.01, height: 47.01)),
        ],
      ),
    );
  }
}
