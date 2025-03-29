import 'package:flutter/material.dart';

class FieldTheme extends ThemeExtension<FieldTheme> {
  const FieldTheme({this.primary, this.secondary, this.error});

  final Color? primary;
  final Color? secondary;
  final Color? error;

  @override
  FieldTheme copyWith({Color? primary, Color? secondary, Color? error}) {
    return FieldTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      error: error ?? this.error,
    );
  }

  @override
  ThemeExtension<FieldTheme> lerp(covariant ThemeExtension<FieldTheme>? other, double t) {
    if (other is! FieldTheme) {
      return this;
    }
    return FieldTheme(
      primary: Color.lerp(primary, other.primary, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      error: Color.lerp(error, other.error, t),
    );
  }
}
