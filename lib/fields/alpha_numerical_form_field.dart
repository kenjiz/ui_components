import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class AlphaNumericFormField extends StatelessWidget {
  const AlphaNumericFormField({
    required this.controller,
    required this.labelText,
    required this.enabled,
    this.validator,
    super.key,
  });

  final TextEditingController controller;
  final String labelText;
  final String? Function(String? value)? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      enabled: enabled,
      isDense: true,
      label: labelText,
      validator: validator,
    );
  }
}
