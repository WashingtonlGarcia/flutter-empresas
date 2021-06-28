import 'package:flutter/cupertino.dart' show TextStyle, FontWeight;
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_color_palette.dart';

abstract class IAppFont {
  TextStyle get button;

  TextStyle get input;

  TextStyle get inputTitle;

  TextStyle get inputSearch;

  TextStyle get headline6Black;

  TextStyle get headline7White;

  TextStyle get headline7Gray;

  TextStyle get body2;

  TextStyle get headline6White;

  TextStyle get headline7Black;
}

class DefaultAppFont implements IAppFont {
  @override
  TextStyle get headline6White => GoogleFonts.rubik(color: AppColorPalette.black, fontWeight: FontWeight.w500, fontSize: 20);

  @override
  TextStyle get headline6Black => GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w400, color: AppColorPalette.white);

  @override
  TextStyle get headline7Black => GoogleFonts.rubik(fontWeight: FontWeight.w300, fontSize: 18, color: AppColorPalette.black);

  @override
  TextStyle get inputSearch => GoogleFonts.rubik(fontWeight: FontWeight.w300, fontSize: 18, color: AppColorPalette.graniteGray.withOpacity(0.7));

  @override
  TextStyle get headline7White => GoogleFonts.rubik(fontWeight: FontWeight.w700, fontSize: 18, color: AppColorPalette.white);

  @override
  TextStyle get headline7Gray => GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w300, color: AppColorPalette.graniteGray);

  @override
  TextStyle get button => GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 16, color: AppColorPalette.white);

  @override
  TextStyle get input => GoogleFonts.rubik(fontWeight: FontWeight.w300, fontSize: 16, color: AppColorPalette.black);

  @override
  TextStyle get inputTitle => GoogleFonts.rubik(fontWeight: FontWeight.w400, fontSize: 14, color: AppColorPalette.graniteGray);

  @override
  TextStyle get body2 => GoogleFonts.rubik(color: AppColorPalette.graniteGray, fontSize: 14, fontWeight: FontWeight.w300);
}
