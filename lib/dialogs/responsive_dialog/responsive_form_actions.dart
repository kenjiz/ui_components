import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class ResponsiveFormActions extends StatelessWidget {
  const ResponsiveFormActions({
    required this.onPrimaryPressed,
    this.onCancelPressed,
    this.primaryText,
    this.cancelText,
    this.isLoading = false,
    super.key,
  });

  final VoidCallback onPrimaryPressed;
  final VoidCallback? onCancelPressed;
  final String? primaryText;
  final String? cancelText;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimens.s24, right: Dimens.s24, bottom: Dimens.s24),
      child: Row(
        children: [
          Expanded(
            child: CancelButton(
              text: cancelText ?? 'Cancel',
              onPressed: onCancelPressed ?? Navigator.of(context).pop,
            ),
          ),
          Gaps.s24,
          Expanded(
            child: PrimaryButton(
              text: primaryText ?? 'Save',
              onPressed: onPrimaryPressed,
              isLoading: isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
