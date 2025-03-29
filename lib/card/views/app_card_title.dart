import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class AppCardTitle extends StatelessWidget {
  const AppCardTitle({
    required this.onSavePressed,
    required this.title,
    this.backButtonText,
    this.onBackPressed,
    this.saveButtonText,
    this.hasDivider = false,
    super.key,
  });

  final String title;
  final VoidCallback? onSavePressed;
  final String? backButtonText;
  final VoidCallback? onBackPressed;
  final String? saveButtonText;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubtitleBackButton(onBackPressed: onBackPressed, backButtonText: backButtonText),
                  Gaps.s8,
                  Text(title, style: context.textTheme.headlineSmall),
                ],
              ),
            ),
            SizedBox(
              width: 160,
              child: ElevatedButton.icon(
                iconAlignment: IconAlignment.end,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.buttonTheme.primaryBackgroundColor,
                ),
                icon: const Icon(Ionicons.save_outline, color: Colors.white, size: Dimens.s16),
                label: Text(
                  saveButtonText ?? 'Save Changes',
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: onSavePressed,
              ),
            ),
          ],
        ),
        if (hasDivider) ...[Gaps.s16, Divider(color: Colors.grey[300], thickness: 0.8)],
      ],
    );
  }
}
