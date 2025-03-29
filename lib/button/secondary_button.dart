import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.isLoading = false,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;
  final bool enabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onPressed,
      type: ButtonType.secondary,
      enabled: enabled,
      child: isLoading ? const CircularLoader() : Text(text),
    );
  }
}
