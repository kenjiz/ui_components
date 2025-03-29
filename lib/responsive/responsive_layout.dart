import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({required this.mobile, required this.desktop, super.key});

  final Widget mobile;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width.isMobile) {
          return mobile;
        }
        return desktop;
      },
    );
  }
}
