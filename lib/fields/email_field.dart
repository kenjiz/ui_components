import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    required this.controller,
    this.enabled = true,
    this.textInputAction,
    this.autofocus = false,
    this.labelText,
    this.hintText,
    super.key,
  });

  final TextEditingController controller;
  final bool enabled;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: labelText ?? 'Email Address',
        hintText: hintText ?? 'Enter your email',
        prefixIcon: const Icon(Ionicons.mail_outline),
        prefixIconColor: context.fieldTheme.primary,
        isDense: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }

        if (!EmailValidator.validate(value)) {
          return 'Please enter a valid email';
        }

        return null;
      },
    );
  }
}
