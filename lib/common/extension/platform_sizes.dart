import 'package:flutter/material.dart';

const double minDesktopWidth = 1200;
const double maxMobileWidth = 900;

extension PlatformSizes on double {
  bool get isMobile => this < maxMobileWidth;
  bool get isTablet => this >= maxMobileWidth && this < minDesktopWidth;
  bool get isDesktop => this >= minDesktopWidth;
}

extension PlatformSizeDetect on MediaQueryData {
  bool get isMobile => size.width < maxMobileWidth;
  bool get isTablet => size.width >= maxMobileWidth && size.width < minDesktopWidth;
  bool get isDesktop => size.width >= minDesktopWidth;
}

class Breakpoint {
  static const double desktop = 1200;
  static const double tablet = 900;
  static const double mobile = 600;
}
