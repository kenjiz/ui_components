import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.buttonText,
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;
  final Widget icon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onPressed,
      type: ButtonType.secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon, Gaps.s10, Text(buttonText)],
      ),
    );
  }
}
