import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class CommonResponsiveContainer extends StatelessWidget {
  const CommonResponsiveContainer({
    required this.mobile,
    required this.desktop,
    this.appBarTitle,
    super.key,
  });

  final String? appBarTitle;
  final Widget mobile;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      releaseFocus: true,
      resizeToAvoidBottomInset: true,
      appBar: appBarTitle != null && context.mediaQuery.isMobile
          ? AppBar(
              title: Text(appBarTitle!),
            )
          : null,
      body: ResponsiveLayout(mobile: mobile, desktop: desktop),
    );
  }
}
