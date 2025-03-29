import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_components/ui_components.dart';

class UniqueEntryField extends StatefulWidget {
  const UniqueEntryField({
    required this.controller,
    required this.onFocusChanged,
    required this.onResetValue,
    required this.isUnique,
    required this.label,
    required this.hintText,
    required this.helperText,
    this.enabled = true,
    this.isLoading = false,
    this.oldValue,
    this.debounce = 800,
    this.textInputAction,
    this.uniqueErrorMessage,
    this.keyboardType,
    this.validator,
    this.isDense = false,
    this.textInputFormatters,
    this.prefixIcon,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;
  final String helperText;
  final bool enabled;
  final String? oldValue;
  final int debounce;
  final ValueSetter<String> onFocusChanged;
  final VoidCallback onResetValue;
  final bool isLoading;
  final bool isUnique;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? uniqueErrorMessage;
  final String? Function(String?)? validator;
  final bool isDense;
  final List<TextInputFormatter>? textInputFormatters;
  final Widget? prefixIcon;

  @override
  State<UniqueEntryField> createState() => _UniqueEntryFieldState();
}

class _UniqueEntryFieldState extends State<UniqueEntryField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus && widget.controller.text != widget.oldValue) {
      EasyDebounce.debounce(
        'unique_entry_field',
        Duration(milliseconds: widget.debounce),
        () => widget.onFocusChanged(widget.controller.text),
      );
    } else {
      widget.onResetValue();
    }
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      focusNode: _focusNode,
      enabled: widget.enabled,
      inputFormatters: widget.textInputFormatters,
      decoration: InputDecoration(
        hintText: widget.hintText,
        helperText: widget.helperText,
        isDense: widget.isDense,
        label: Text(widget.label),
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.isLoading
                ? Transform.scale(
                  scale: 0.4,
                  child: const CircularProgressIndicator(strokeWidth: 4),
                )
                : widget.isUnique && widget.oldValue != widget.controller.text
                ? const Icon(Ionicons.checkmark, color: Colors.green)
                : null,
      ),
      keyboardType: widget.keyboardType ?? TextInputType.name,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      forceErrorText: widget.uniqueErrorMessage,
      validator: widget.validator,
    );
  }
}
