import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class ResponsiveFormHeader extends StatelessWidget {
  const ResponsiveFormHeader({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gaps.s24,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.s24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: context.textTheme.headlineSmall),
              IconButton(onPressed: Navigator.of(context).pop, icon: const Icon(Icons.close)),
            ],
          ),
        ),
        Gaps.s5,
        const Divider(),
      ],
    );
  }
}
