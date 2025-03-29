import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class PopoverDropdownMenuItem extends StatelessWidget {
  const PopoverDropdownMenuItem({required this.items, this.padding, super.key});

  final List<MenuItem> items;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:
          items.map((item) {
            return GestureDetector(
              onTap: item.onPressed,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding:
                      padding ??
                      const EdgeInsets.symmetric(horizontal: Dimens.s24, vertical: Dimens.s12),
                  child: Text(
                    item.title,
                    textAlign: TextAlign.start,
                    style: context.textTheme.bodyMedium?.copyWith(color: item.textColor),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
