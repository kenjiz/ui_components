import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';
import 'package:ui_components/ui_components.dart';

class AttributedTextTag {
  const AttributedTextTag.action({
    required this.name,
    required this.action,
    this.style,
  });

  const AttributedTextTag.styled({
    required this.name,
    required this.style,
  }) : action = null;

  final String name;
  final TextStyle? style;
  final StyledTextTagActionCallback? action;

  StyledTextTagBase getTextTag(BuildContext context) {
    final textStyle = style ?? context.textTheme.bodyMedium;
    return action == null ? StyledTextTag(style: textStyle) : StyledTextActionTag(action!, style: textStyle);
  }
}
