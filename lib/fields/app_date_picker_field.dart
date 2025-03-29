import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_components/ui_components.dart';

class AppDatePickerField extends StatefulWidget {
  const AppDatePickerField({
    required this.labelText,
    this.initialDate,
    this.onChanged,
    this.validator,
    super.key,
  });
  final String labelText;
  final DateTime? initialDate;
  final ValueChanged<DateTime?>? onChanged;
  final String? Function(String? value)? validator;

  @override
  State<AppDatePickerField> createState() => _AppDatePickerFieldState();
}

class _AppDatePickerFieldState extends State<AppDatePickerField> with RestorationMixin {
  final FocusNode _focusNode = FocusNode();
  final controller = TextEditingController();

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture(
        onComplete: _selectDate,
        onPresent:
            (navigator, arguments) => navigator.restorablePush(
              _datePickerRoute,
              arguments: _selectedDate.value.millisecondsSinceEpoch,
            ),
      );

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFieldFocusChanged);
  }

  @override
  void dispose() {
    controller.dispose();
    _focusNode
      ..removeListener(_onFieldFocusChanged)
      ..dispose();

    super.dispose();
  }

  void _onFieldFocusChanged() {
    if (_focusNode.hasFocus) {
      _restorableDatePickerRouteFuture.present();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      focusNode: _focusNode,
      readOnly: true,
      validator: widget.validator,
      decoration: InputDecoration(
        label: Text(widget.labelText),
        isDense: true,
        suffixIcon: IconButton(
          icon: const Icon(Ionicons.calendar_outline),
          onPressed: _restorableDatePickerRouteFuture.present,
        ),
      ),
    );
  }

  @pragma('vm:entry-point')
  Route<DateTime> _datePickerRoute(BuildContext context, Object? arguments) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'app_date_picker_field',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: widget.initialDate ?? DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2010),
          lastDate: DateTime(2100),
        );
      },
    );
  }

  @override
  String? get restorationId => 'app_date_picker_field';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(_restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        controller.text = DateFormat('MM/dd/yyyy').format(newSelectedDate);
        widget.onChanged?.call(newSelectedDate);
      });
    }
    _focusNode.unfocus();
  }
}
