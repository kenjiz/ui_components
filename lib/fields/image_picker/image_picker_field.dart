import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';
import 'package:universal_html/html.dart' hide Text;

class ImagePickerField extends StatefulWidget {
  const ImagePickerField({
    required this.title,
    required this.icon,
    required this.cameraOrientation,
    required this.onPicked,
    this.errorMessage,
    this.enabled = true,
    super.key,
  });

  final String title;
  final IconData icon;
  final CameraOrientation cameraOrientation;
  final void Function(File? file) onPicked;
  final String? errorMessage;
  final bool enabled;

  @override
  State<ImagePickerField> createState() => _ImagePickerFieldState();
}

class _ImagePickerFieldState extends State<ImagePickerField> {
  File? _image;
  Uint8List? _imageBytes;

  Future<void> _onPicked() async {
    final cameraDevice = widget.cameraOrientation == CameraOrientation.front ? CameraDevice.front : CameraDevice.rear;

    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: cameraDevice,
    );

    if (image == null) return;

    final imageData = await image.readAsBytes();

    final file = File([imageData], image.name, {'type': image.mimeType});

    setState(() {
      _image = file;
      _imageBytes = imageData;
    });

    widget.onPicked.call(file);
  }

  String get title => widget.title;
  IconData get icon => widget.icon;
  String? get errorMessage => widget.errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Gaps.s10,
        InkWell(
          onTap: widget.enabled ? _onPicked : null,
          child: PickerContainer(
            icon: icon,
            image: _image,
            enabled: widget.enabled,
            errorMessage: errorMessage,
            imageBytes: _imageBytes,
          ),
        ),
        if (errorMessage != null) ...[
          Gaps.s10,
          Text(
            errorMessage!,
            style: context.textTheme.bodySmall?.copyWith(color: context.fieldTheme.error),
          ),
        ],
      ],
    );
  }
}
