import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:ui_components/ui_components.dart';

class AvatarDropdown extends StatefulWidget {
  const AvatarDropdown({required this.avatarUrl, required this.menuItems, super.key});

  final String avatarUrl;
  final List<MenuItem> menuItems;

  @override
  State<AvatarDropdown> createState() => _AvatarDropdownState();
}

class _AvatarDropdownState extends State<AvatarDropdown> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
        context: context,
        constraints: const BoxConstraints.expand(),
        bodyBuilder: (context) => PopoverDropdownMenuItem(items: widget.menuItems),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: CircleAvatar(backgroundImage: NetworkImage(widget.avatarUrl)),
      ),
    );
  }
}
