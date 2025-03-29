import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class SubtitleBackButton extends StatelessWidget {
  const SubtitleBackButton({required this.onBackPressed, required this.backButtonText, super.key});

  final VoidCallback? onBackPressed;
  final String? backButtonText;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onBackPressed,
        child: Row(
          children: [
            const Icon(Ionicons.arrow_back_outline, size: Dimens.s14, color: Colors.black54),
            Gaps.s6,
            Text(
              backButtonText ?? 'Back',
              style: context.textTheme.bodySmall?.copyWith(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
