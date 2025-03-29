import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class ScrollableConstrainedContainer extends StatefulWidget {
  const ScrollableConstrainedContainer({
    required this.child,
    this.maxWidth = 800,
    this.iconColor = Colors.blue,
    super.key,
  });

  final Widget child;
  final double maxWidth;
  final Color iconColor;

  @override
  State<ScrollableConstrainedContainer> createState() => _ScrollableConstrainedContainerState();
}

class _ScrollableConstrainedContainerState extends State<ScrollableConstrainedContainer> {
  bool showUpButton = false;
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    const showUpButtonOffset = 10;

    if (scrollController.offset > showUpButtonOffset) {
      setState(() => showUpButton = true);
    } else {
      setState(() => showUpButton = false);
    }
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: context.mediaQuery.isDesktop ? widget.maxWidth : double.infinity,
              ),
              child: widget.child,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: showUpButton ? 1 : 0,
            child: IconButton.filled(
              onPressed: () {
                scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                );
                setState(() => showUpButton = false);
              },
              color: widget.iconColor,
              icon: const Icon(Icons.arrow_upward, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
