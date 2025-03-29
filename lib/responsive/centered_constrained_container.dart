import 'package:flutter/material.dart';

class CenteredConstrainedContainer extends StatelessWidget {
  const CenteredConstrainedContainer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Container(constraints: const BoxConstraints(maxWidth: 500), child: child)],
      ),
    );
  }
}
