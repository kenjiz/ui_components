import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onPressed,
      type: ButtonType.cancel,
      child: isLoading ? const CircularLoader() : Text(text),
    );
  }
}
