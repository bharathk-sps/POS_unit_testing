import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  static const int desktopSize = 1366;
  static const int tabletSize = 768;
  static const int mobileSize = 360;

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const Responsive({
    Key? key,
    @required this.mobile,
    @required this.tablet,
    @required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileSize;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < desktopSize &&
      MediaQuery.of(context).size.width >= tabletSize;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= desktopSize) {
          return desktop!;
        } else if (constraints.maxWidth >= tabletSize) {
          return tablet!;
        } else {
          return mobile!;
        }
      },
    );
  }
}
