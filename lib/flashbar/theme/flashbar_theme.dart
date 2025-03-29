import 'package:flutter/material.dart';

class FlashbarThemeExt extends ThemeExtension<FlashbarThemeExt> {
  FlashbarThemeExt({this.success, this.error, this.warning, this.info});

  final Color? success;
  final Color? error;
  final Color? warning;
  final Color? info;

  @override
  ThemeExtension<FlashbarThemeExt> lerp(
    covariant ThemeExtension<FlashbarThemeExt>? other,
    double t,
  ) {
    if (other is! FlashbarThemeExt) {
      return this;
    }
    return FlashbarThemeExt(
      success: Color.lerp(success, other.success, t),
      error: Color.lerp(error, other.error, t),
      warning: Color.lerp(warning, other.warning, t),
      info: Color.lerp(info, other.info, t),
    );
  }

  @override
  FlashbarThemeExt copyWith({
    Color? success,
    Color? error,
    Color? warning,
    Color? info,
  }) {
    return FlashbarThemeExt(
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      info: info ?? this.info,
    );
  }
}
