import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class ResponsiveDialog extends StatelessWidget {
  const ResponsiveDialog({
    required this.headerTitle,
    required this.child,
    required this.heightFactor,
    super.key,
    this.widthFactor,
  });

  final String headerTitle;
  final Widget child;
  final double heightFactor;
  final double? widthFactor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: heightFactor,
      widthFactor: widthFactor ?? (context.mediaQueryWidth.isDesktop ? 0.3 : 0.7),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(Dimens.s8),
        child: Column(
          children: [ResponsiveFormHeader(title: headerTitle), Gaps.s16, Expanded(child: child)],
        ),
      ),
    );
  }
}
