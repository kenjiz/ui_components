import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class AppCard extends StatelessWidget {
  const AppCard({required this.child, this.borderRadius, super.key});

  final Widget child;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(padding: const EdgeInsets.all(Dimens.s24), child: child),
    );
  }
}
