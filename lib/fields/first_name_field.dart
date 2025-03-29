import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class FirstNameField extends StatelessWidget {
  const FirstNameField({required this.controller, this.enabled = true, super.key});

  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      label: 'First name',
      hintText: 'Enter your first name',
      prefixIcon: const Icon(Ionicons.person_circle_outline),
      enabled: enabled,
      isDense: true,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }
}
