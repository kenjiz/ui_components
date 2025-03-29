import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.isLoading = false,
    this.icon,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool isLoading;
  final Widget? icon;

  Widget _buildButton() {
    if (icon != null) {
      return Row(mainAxisSize: MainAxisSize.min, children: [icon!, Gaps.s10, Text(text)]);
    }
    return Text(text);
  }

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onPressed,
      type: ButtonType.primary,
      enabled: enabled,
      child: isLoading ? const CircularLoader() : _buildButton(),
    );
  }
}
