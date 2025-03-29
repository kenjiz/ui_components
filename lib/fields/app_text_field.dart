import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_components/ui_components.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    this.controller,
    this.label,
    this.hintText,
    this.validator,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.suffixIconColor,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.decoration,
    this.maxLength,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.maxLines,
    this.forceErrorText,
    this.focusNode,
    this.inputFormatters,
    this.readOnly = false,
    this.helperText,
    this.isDense = false,
    this.onChanged,
    this.autofocus = false,
    super.key,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final String? Function(String? value)? validator;
  final Icon? prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final int? maxLength;
  final void Function(String value)? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final int? maxLines;
  final String? forceErrorText;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final String? helperText;
  final bool isDense;
  final ValueSetter<String>? onChanged;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      enabled: enabled,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      readOnly: readOnly,
      maxLines: maxLines,
      forceErrorText: forceErrorText,
      autocorrect: false,
      decoration:
          decoration ??
          InputDecoration(
            label: Text(label ?? ''),
            alignLabelWithHint: true,
            hintText: hintText,
            prefixIcon: prefixIcon,
            prefixIconColor: context.fieldTheme.primary,
            suffixIcon: suffixIcon,
            suffixIconColor: suffixIconColor,
            helperText: helperText,
            isDense: isDense,
          ),
      focusNode: focusNode,
      autofocus: autofocus,
      validator: validator,
    );
  }
}
