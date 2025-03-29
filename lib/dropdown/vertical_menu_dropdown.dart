import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:ui_components/ui_components.dart';

class VerticalMenuDropdown extends StatefulWidget {
  const VerticalMenuDropdown({required this.menuItems, super.key});

  final List<MenuItem> menuItems;

  @override
  State<VerticalMenuDropdown> createState() => _VerticalMenuDropdownState();
}

class _VerticalMenuDropdownState extends State<VerticalMenuDropdown> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IconButton(
        icon: const Icon(Ionicons.ellipsis_vertical),
        onPressed:
            () => showPopover(
              barrierColor: Colors.transparent,
              context: context,
              constraints: const BoxConstraints.expand(),
              bodyBuilder: (context) => PopoverDropdownMenuItem(items: widget.menuItems),
            ),
      ),
    );
  }
}
