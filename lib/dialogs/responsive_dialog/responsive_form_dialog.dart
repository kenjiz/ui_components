import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class ResponsiveFormDialog extends StatelessWidget {
  const ResponsiveFormDialog({
    required this.autovalidateMode,
    required this.formKey,
    required this.children,
    required this.headerTitle,
    required this.onPrimaryPressed,
    this.primaryText,
    this.cancelText,
    this.onCancelPressed,
    this.isLoading = false,
    this.heightFactor = 0.85,
    this.widthFactor,
    super.key,
  });

  final AutovalidateMode autovalidateMode;
  final GlobalKey<FormState> formKey;
  final List<Widget> children;
  final String headerTitle;
  final VoidCallback onPrimaryPressed;
  final String? primaryText;
  final String? cancelText;
  final VoidCallback? onCancelPressed;
  final bool isLoading;
  final double heightFactor;
  final double? widthFactor;

  @override
  Widget build(BuildContext context) {
    return ResponsiveDialog(
      headerTitle: headerTitle,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(Dimens.s24),
                shrinkWrap: true,
                children: children,
              ),
            ),
            ResponsiveFormActions(
              primaryText: primaryText,
              onPrimaryPressed: onPrimaryPressed,
              onCancelPressed: onCancelPressed,
              cancelText: cancelText,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
