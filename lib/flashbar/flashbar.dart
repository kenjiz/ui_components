// ignore_for_file: public_member_api_docs, must_be_immutable

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class Flashbar extends Flushbar<void> {
  Flashbar({
    required this.color,
    required super.message,
    required this.iconData,
    this.action,
    this.isIndefinite = false,
    super.title,
    super.key,
  }) : super(
          duration: isIndefinite ? null : const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: color,
          borderRadius: BorderRadius.circular(10),
          margin: const EdgeInsets.all(Dimens.s8),
          padding: const EdgeInsets.all(Dimens.s10),
          icon: Icon(iconData, color: Colors.white.withAlpha(65)),
          mainButton: action,
        );

  factory Flashbar.success(BuildContext context, String message) => Flashbar(
        iconData: Ionicons.checkmark_circle_outline,
        color: context.flashbarTheme.success ?? Colors.green,
        message: message,
      );

  factory Flashbar.error(BuildContext context, String message) => Flashbar(
        iconData: Ionicons.close_circle_outline,
        color: context.flashbarTheme.error ?? Colors.red,
        message: message,
      );

  factory Flashbar.warning(BuildContext context, String message) => Flashbar(
        iconData: Ionicons.alert_circle_outline,
        color: context.flashbarTheme.warning ?? Colors.amber,
        message: message,
      );

  factory Flashbar.info(BuildContext context, String message) => Flashbar(
        iconData: Ionicons.information_circle_outline,
        color: context.flashbarTheme.info ?? Colors.blue,
        message: message,
      );

  factory Flashbar.errorWithAction(
    BuildContext context,
    String title,
    String message,
    VoidCallback action,
  ) =>
      Flashbar(
        color: context.flashbarTheme.error ?? Colors.red,
        iconData: Ionicons.close_circle_outline,
        message: message,
        title: title,
        action: TextButton(onPressed: action, child: const Text('OK')),
        isIndefinite: true,
      );

  final Color color;
  final IconData iconData;
  final Widget? action;
  final bool isIndefinite;
}
