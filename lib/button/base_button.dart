import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    required this.onPressed,
    required this.child,
    required this.type,
    this.enabled = true,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final ButtonType type;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = switch (type) {
      ButtonType.primary => context.buttonTheme.primaryBackgroundColor,
      ButtonType.secondary => context.buttonTheme.secondaryBackgroundColor,
      ButtonType.cancel => Colors.grey[500],
    };

    final borderColor = switch (type) {
      ButtonType.primary => context.buttonTheme.primaryBorderColor,
      ButtonType.secondary => context.buttonTheme.secondaryBorderColor,
      ButtonType.cancel => Colors.transparent,
    };

    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        elevation: type == ButtonType.primary ? 1 : 0,
        backgroundColor: backgroundColor,
        textStyle: context.textTheme.labelLarge?.copyWith(
          color:
              type == ButtonType.primary
                  ? context.buttonTheme.primaryTextColor
                  : context.buttonTheme.secondaryTextColor,
        ),
        shadowColor: type != ButtonType.primary ? Colors.transparent : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: borderColor!),
        ),
      ),
      child: DefaultTextStyle.merge(
        child: child,
        style: context.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color:
              type == ButtonType.primary
                  ? context.buttonTheme.primaryTextColor
                  : context.buttonTheme.secondaryTextColor,
        ),
      ),
    );
  }
}
