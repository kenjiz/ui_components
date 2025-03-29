import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class LastNameField extends StatelessWidget {
  const LastNameField({required this.controller, this.enabled = true, super.key});

  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      label: 'Last name',
      hintText: 'Enter your last name',
      prefixIcon: const Icon(Ionicons.person_circle_outline),
      enabled: enabled,
      isDense: true,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }
}
