import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class EditableTextRegionField extends StatefulWidget {
  const EditableTextRegionField({
    required this.initialTextWidget,
    required this.replacementWidget,
    required this.onDoneEditing,
    this.onStartEditing,
    this.onCancelEditing,
    this.editable = true,
    this.extraActions,
    super.key,
  });

  final Widget initialTextWidget;
  final Widget replacementWidget;
  final VoidCallback onDoneEditing;
  final VoidCallback? onStartEditing;
  final VoidCallback? onCancelEditing;
  final bool editable;
  final List<Widget>? extraActions;

  @override
  State<EditableTextRegionField> createState() => _EditableTextRegionFieldState();
}

class _EditableTextRegionFieldState extends State<EditableTextRegionField> {
  bool _isEditable = false;
  bool _showReplacementWidget = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isEditable = true),
      onExit: (_) => setState(() => _isEditable = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_showReplacementWidget && widget.editable)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.replacementWidget,
                Gaps.s5,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SmallTextButton(
                      label: 'Save',
                      color: Colors.green,
                      onPressed: () {
                        widget.onDoneEditing.call();
                        setState(() {
                          _showReplacementWidget = false;
                          _isEditable = false;
                        });
                      },
                    ),
                    Gaps.s10,
                    SmallTextButton(
                      label: 'Cancel',
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          _showReplacementWidget = false;
                          _isEditable = false;
                        });
                        widget.onCancelEditing?.call();
                      },
                    ),
                  ],
                ),
              ],
            )
          else
            widget.initialTextWidget,
          if (_isEditable && !_showReplacementWidget && widget.editable)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmallTextButton(
                  label: 'Edit',
                  onPressed: () {
                    widget.onStartEditing?.call();
                    setState(() {
                      _showReplacementWidget = true;
                      _isEditable = false;
                    });
                  },
                ),
                Gaps.s10,
                if (widget.extraActions != null) ...widget.extraActions!,
              ],
            ),
        ],
      ),
    );
  }
}

class SmallTextButton extends StatelessWidget {
  const SmallTextButton({required this.label, required this.onPressed, this.color, super.key});

  final String label;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        label,
        style: context.textTheme.bodySmall?.copyWith(fontSize: 12, color: color ?? Colors.blue),
      ),
    );
  }
}
