import 'colors/colors.dart';
import 'fonts/fonts.dart';

mixin MixinTheme {
  IAppTheme get theme => DefaultAppTheme();
}

abstract class IAppTheme {
  IAppColor get colors;

  IAppFont get fonts;

  IAppColorGrandient get grandients;
}

class DefaultAppTheme implements IAppTheme {
  @override
  IAppColor get colors => DefaultAppColor();

  @override
  IAppFont get fonts => DefaultAppFont();

  @override
  IAppColorGrandient get grandients => DefaultAppColorGradient();
}
