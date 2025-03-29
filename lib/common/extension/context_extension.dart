import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

/// BuildContext extensions
extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  /// Defines current theme [Brightness].
  Brightness get brightness => theme.brightness;

  /// Whether current theme [Brightness] is light.
  bool get isLight => brightness == Brightness.light;

  /// Whether current theme [Brightness] is dark.
  bool get isDark => !isLight;

  ColorScheme get colorScheme => theme.colorScheme;

  AppButtonTheme get buttonTheme => theme.extension<AppButtonTheme>()!;

  FlashbarThemeExt get flashbarTheme => theme.extension<FlashbarThemeExt>()!;

  FieldTheme get fieldTheme => theme.extension<FieldTheme>()!;

  TextTheme get textTheme => Theme.of(this).textTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get mediaQueryWidth => mediaQuery.size.width;

  double get mediaQueryHeight => mediaQuery.size.height;
}
