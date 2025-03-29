import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';
import 'package:url_launcher/url_launcher.dart';

class TextTagCollection {
  const TextTagCollection._();

  static List<AttributedTextTag> getTextTags(
    BuildContext context, [
    TextStyle? style,
    void Function(String tappedText)? onTap,
  ]) {
    final textStyle = style ?? context.textTheme.bodyMedium;
    return [
      AttributedTextTag.styled(
        name: 'highlight',
        style: textStyle?.copyWith(color: context.theme.primaryColor),
      ),
      AttributedTextTag.styled(
        name: 'b',
        style: textStyle?.copyWith(fontWeight: FontWeight.w600, color: textStyle.color),
      ),
      AttributedTextTag.styled(
        name: 'b-error',
        style: textStyle?.copyWith(fontWeight: FontWeight.w600, color: Colors.red),
      ),
      AttributedTextTag.styled(
        name: 'error',
        style: textStyle?.copyWith(color: Colors.red, decoration: TextDecoration.underline),
      ),
      AttributedTextTag.styled(
        name: 'warning',
        style: textStyle?.copyWith(color: Colors.amber),
      ),
      AttributedTextTag.action(
        name: 'action',
        action: (text, _) => onTap?.call(text ?? ''),
        style: textStyle?.copyWith(color: context.theme.primaryColor, fontWeight: FontWeight.w500),
      ),
      AttributedTextTag.action(
        name: 'link',
        style: textStyle?.copyWith(color: context.theme.primaryColor),
        action: (_, attrs) => attrs.values.first != null ? launchUrl(Uri.parse(attrs.values.first!)) : null,
      ),
    ];
  }
}
