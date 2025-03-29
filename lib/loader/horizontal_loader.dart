import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class HorizontalLoader extends StatelessWidget {
  const HorizontalLoader({
    this.minHeight = Dimens.s32,
    this.value,
    this.backgroundColor,
    this.valueColor,
    super.key,
  });

  final double? minHeight;
  final double? value;
  final Color? backgroundColor;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: backgroundColor ?? Colors.grey[100],
      borderRadius: BorderRadius.circular(Dimens.s50),
      minHeight: minHeight,
      valueColor: AlwaysStoppedAnimation<Color>(valueColor ?? Colors.grey[200]!),
      value: value,
    );
  }
}
