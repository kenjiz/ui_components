import 'package:flutter/material.dart';

class AppButtonTheme extends ThemeExtension<AppButtonTheme> {
  AppButtonTheme({
    this.primaryBackgroundColor,
    this.secondaryBackgroundColor,
    this.primaryBorderColor,
    this.secondaryBorderColor,
    this.primaryTextColor,
    this.secondaryTextColor,
  });

  final Color? primaryBackgroundColor;
  final Color? secondaryBackgroundColor;
  final Color? primaryBorderColor;
  final Color? secondaryBorderColor;
  final Color? primaryTextColor;
  final Color? secondaryTextColor;

  @override
  AppButtonTheme copyWith({
    Color? primaryBackgroundColor,
    Color? secondaryBackgroundColor,
    Color? primaryBorderColor,
    Color? secondaryBorderColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
  }) {
    return AppButtonTheme(
      primaryBackgroundColor: primaryBackgroundColor ?? this.primaryBackgroundColor,
      secondaryBackgroundColor: secondaryBackgroundColor ?? this.secondaryBackgroundColor,
      primaryBorderColor: primaryBorderColor ?? this.primaryBorderColor,
      secondaryBorderColor: secondaryBorderColor ?? this.secondaryBorderColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
    );
  }

  @override
  AppButtonTheme lerp(ThemeExtension? other, double t) {
    if (other is! AppButtonTheme) {
      return this;
    }
    return AppButtonTheme(
      primaryBackgroundColor: Color.lerp(primaryBackgroundColor, other.primaryBackgroundColor, t),
      secondaryBackgroundColor: Color.lerp(
        secondaryBackgroundColor,
        other.secondaryBackgroundColor,
        t,
      ),
      primaryBorderColor: Color.lerp(primaryBorderColor, other.primaryBorderColor, t),
      secondaryBorderColor: Color.lerp(secondaryBorderColor, other.secondaryBorderColor, t),
      primaryTextColor: Color.lerp(primaryTextColor, other.primaryTextColor, t),
      secondaryTextColor: Color.lerp(secondaryTextColor, other.secondaryTextColor, t),
    );
  }
}
