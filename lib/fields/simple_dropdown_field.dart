import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class SimpleDropdownField<T> extends StatefulWidget {
  const SimpleDropdownField({
    required this.labelText,
    required this.compareFn,
    required this.onChanged,
    required this.items,
    this.itemBuilder,
    this.enabled = true,
    this.validator,
    this.itemAsString,
    this.selectedItem,
    super.key,
  });

  final String labelText;
  final bool Function(T item1, T item2)? compareFn;
  final List<T> items;
  final ValueSetter<T?> onChanged;
  final DropdownSearchPopupItemBuilder<T>? itemBuilder;
  final bool enabled;
  final String? Function(T? item)? validator;
  final String Function(T item)? itemAsString;
  final T? selectedItem;

  @override
  State<SimpleDropdownField<T>> createState() => _SimpleDropdownFieldState<T>();
}

class _SimpleDropdownFieldState<T> extends State<SimpleDropdownField<T>> {
  T? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      onChanged: (value) {
        widget.onChanged(value);
        setState(() => selectedItem = value);
      },
      enabled: widget.enabled,
      itemAsString: widget.itemAsString,
      compareFn: widget.compareFn,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(label: Text(widget.labelText), isDense: true),
      ),
      validator: widget.validator,
      items: (f, cs) => widget.items,
      selectedItem: selectedItem,
      popupProps: PopupProps.menu(fit: FlexFit.loose, itemBuilder: widget.itemBuilder),
    );
  }
}
