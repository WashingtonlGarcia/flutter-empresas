import 'package:flutter/cupertino.dart' show RadialGradient, Gradient, LinearGradient;

import 'app_color_palette.dart';

abstract class IAppColorGrandient {
  RadialGradient get grapeAndByzantineAndMediumVioletRed;

  Gradient get mediumVioletRedAndByzantineAndGrape;
}

class DefaultAppColorGradient implements IAppColorGrandient {
  @override
  RadialGradient get grapeAndByzantineAndMediumVioletRed => RadialGradient(
        colors: [AppColorPalette.grape, AppColorPalette.byzantine, AppColorPalette.mediumVioletRed],
      );

  @override
  Gradient get mediumVioletRedAndByzantineAndGrape =>
      LinearGradient(colors: [AppColorPalette.mediumVioletRed, AppColorPalette.byzantine, AppColorPalette.grape]);
}
