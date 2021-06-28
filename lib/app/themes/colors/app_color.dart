import 'package:flutter/material.dart' show Color;

import 'app_color_palette.dart';

abstract class IAppColor {
  Color get background;

  Color get primary;

  Color get secondary;

  Color get error;

  Color get input;

  Color get inputIcon;

  Color get inputText;

  Color get appBarIcon;
}

class DefaultAppColor implements IAppColor {
  @override
  Color get background => AppColorPalette.white;

  @override
  Color get primary => AppColorPalette.razzmatazz;

  @override
  Color get secondary => AppColorPalette.piggyPink;

  @override
  Color get error => AppColorPalette.electricRed;

  @override
  Color get input => AppColorPalette.cultured;

  @override
  Color get inputIcon => AppColorPalette.graniteGray;

  @override
  Color get inputText => AppColorPalette.black;

  @override
  Color get appBarIcon => AppColorPalette.cultured;
}
