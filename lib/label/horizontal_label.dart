import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class HorizontalLabel extends StatelessWidget {
  const HorizontalLabel({
    this.leadingText = '',
    this.trailingText = '',
    this.leadingSpan,
    this.trailingSpan,
    this.leadingFlex,
    this.trailingFlex,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: Dimens.s8,
      horizontal: Dimens.s16,
    ),
    this.trailingWidget,
    this.leadingWidget,
    super.key,
  });

  final String leadingText;
  final String trailingText;

  // For custom type
  final TextSpan? leadingSpan;
  final TextSpan? trailingSpan;
  final int? leadingFlex;
  final int? trailingFlex;
  final EdgeInsets? contentPadding;
  final Widget? leadingWidget;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: contentPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: leadingFlex ?? 1,
            child: leadingWidget ??
                RichText(
                  textAlign: TextAlign.left,
                  text: (leadingSpan != null)
                      ? leadingSpan!
                      : TextSpan(
                          text: leadingText,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                        ),
                ),
          ),
          Expanded(
            flex: trailingFlex ?? 1,
            child: trailingWidget ??
                RichText(
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.visible,
                  text: (trailingSpan != null)
                      ? trailingSpan!
                      : TextSpan(
                          text: trailingText,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                        ),
                ),
          ),
        ],
      ),
    );
  }
}
