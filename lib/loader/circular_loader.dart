import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({this.size = Dimens.s20, this.color = Colors.white, super.key});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(dimension: size, child: CircularProgressIndicator(color: color));
  }
}
