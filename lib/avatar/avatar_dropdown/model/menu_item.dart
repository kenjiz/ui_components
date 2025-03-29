import 'package:flutter/material.dart';

class MenuItem {
  const MenuItem({required this.title, required this.onPressed, this.textColor});
  final String title;
  final VoidCallback onPressed;
  final Color? textColor;
}
