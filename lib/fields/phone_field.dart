import 'package:country_phone_validator/country_phone_validator.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    required this.controller,
    this.enabled = true,
    this.textInputAction,
    super.key,
  });

  final TextEditingController controller;
  final bool enabled;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      keyboardType: TextInputType.phone,
      textInputAction: textInputAction,
      enabled: enabled,
      maxLength: 10,
      decoration: InputDecoration(
        isDense: true,
        counterText: '',
        prefixText: '+63 ',
        labelText: 'Phone Number',
        hintText: 'Enter your number',
        prefixIcon: const Icon(Ionicons.phone_portrait_outline),
        prefixIconColor: context.fieldTheme.primary,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone';
        }

        final isValid = CountryUtils.validatePhoneNumber(value, '+63');

        if (!isValid) {
          return 'Please enter a valid phone number';
        }

        return null;
      },
    );
  }
}
