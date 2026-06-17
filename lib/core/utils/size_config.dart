import 'dart:ui';

import 'package:flutter/material.dart';

class SizeConfig {
  SizeConfig._();

  static const double tablet = 800;
  static const double desktop = 1200;

  static late double screenWidth;
  static late double screenHeight;

  static const double designWidth = 390;
  static const double designHeight = 844;

  static late double widthScale;
  static late double heightScale;

  static void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    screenWidth = size.width;
    screenHeight = size.height;

    widthScale = screenWidth / designWidth;
    heightScale = screenHeight / designHeight;
  }

  static void initMobileSize() {
    final view = PlatformDispatcher.instance.views.first;

    screenWidth = view.physicalSize.width / view.devicePixelRatio;
    screenHeight = view.physicalSize.height / view.devicePixelRatio;

    widthScale = screenWidth / designWidth;
    heightScale = screenHeight / designHeight;
  }

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tablet;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktop;
}

extension ResponsiveSize on num {
  double get w => this * SizeConfig.widthScale;
  double get h => this * SizeConfig.heightScale;

  double get sp =>
      this * ((SizeConfig.widthScale + SizeConfig.heightScale) / 2);
}