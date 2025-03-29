import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';
import 'package:ui_components/ui_components.dart';

class AttributedText extends StatelessWidget {
  const AttributedText(
    this.text, {
    this.style,
    this.textAlign = TextAlign.left,
    this.onTappedActionText,
    this.maxLines,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final void Function(String tappedText)? onTappedActionText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final tagList = TextTagCollection.getTextTags(context, style, onTappedActionText);
    final tags = {for (final tag in tagList) tag.name: tag.getTextTag(context)};

    return StyledText(
      text: text,
      tags: tags,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
