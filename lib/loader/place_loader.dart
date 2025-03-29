import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlaceLoader extends StatelessWidget {
  const PlaceLoader({
    required this.child,
    this.isLoading = false,
    this.ignoreContainers = false,
    this.justifyMultiLineText = false,
    this.containersColor,
    super.key,
  });

  final Widget child;
  final bool isLoading;
  final bool ignoreContainers;
  final bool justifyMultiLineText;
  final Color? containersColor;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.white.withAlpha(60),
        highlightColor: Colors.white.withAlpha(30),
        duration: const Duration(seconds: 1),
      ),
      enabled: isLoading,
      ignoreContainers: ignoreContainers,
      containersColor: containersColor,
      justifyMultiLineText: justifyMultiLineText,
      textBoneBorderRadius: const TextBoneBorderRadius.fromHeightFactor(0.5),
      child: child,
    );
  }
}
