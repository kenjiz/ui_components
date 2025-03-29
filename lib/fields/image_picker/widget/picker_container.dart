import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';
import 'package:universal_html/html.dart';

class PickerContainer extends StatefulWidget {
  const PickerContainer({
    required this.icon,
    this.image,
    this.errorMessage,
    this.enabled = true,
    this.imageBytes,
    super.key,
  });

  final IconData icon;
  final File? image;
  final String? errorMessage;
  final bool enabled;
  final Uint8List? imageBytes;

  @override
  State<PickerContainer> createState() => _PickerContainerState();
}

class _PickerContainerState extends State<PickerContainer> {
  Widget _pickedImageContainer(BuildContext context) {
    return Opacity(
      opacity: widget.enabled ? 1.0 : 0.4,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image:
                widget.imageBytes == null
                    ? const AssetImage('assets/images/placeholder.png')
                    : MemoryImage(widget.imageBytes!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _defaultImageContainer(BuildContext context) {
    final errorBorderColor = context.fieldTheme.error ?? Colors.red;
    final primaryBorderColor = context.fieldTheme.primary ?? Colors.blue;

    return Opacity(
      opacity: widget.enabled ? 1.0 : 0.4,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.errorMessage != null ? errorBorderColor : primaryBorderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            widget.icon,
            size: Dimens.s50,
            color:
                widget.errorMessage != null ? context.fieldTheme.error : context.fieldTheme.primary,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 100,
      child: Stack(
        children: [
          if (widget.image != null)
            _pickedImageContainer(context)
          else
            _defaultImageContainer(context),
        ],
      ),
    );
  }
}
