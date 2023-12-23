import 'package:flutter/material.dart';

class Nsize {
  /// Screen Size
  static final double screenwidth =
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
  static final double screenheight = WidgetsBinding
      .instance.platformDispatcher.views.first.physicalSize.height;

  /// Icon Size
  static const double prifixicon = 26.0;
  static const double labletextfont = 18.0;

  ///Space Between widgets
  static const double spaceBetweenTextField = 12.0;
}
