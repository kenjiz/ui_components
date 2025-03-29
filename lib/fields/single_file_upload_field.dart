import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class SingleFileUploadField extends StatelessWidget {
  const SingleFileUploadField({
    required this.controller,
    required this.labelText,
    required this.onPickFilePressed,
    required this.progressValue,
    super.key,
  });

  final TextEditingController controller;
  final String labelText;
  final VoidCallback onPickFilePressed;
  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TextFormField(
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              label: Text(labelText),
              isDense: true,
              suffixIcon: GestureDetector(
                onTap: onPickFilePressed,
                child: const Icon(Icons.file_upload_outlined),
              ),
            ),
          ),
        ),
        Gaps.s4,
        Flexible(
          child: HorizontalLoader(
            valueColor: context.theme.primaryColor,
            minHeight: Dimens.s4,
            value: progressValue,
          ),
        ),
      ],
    );
  }
}
