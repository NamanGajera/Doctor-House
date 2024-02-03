import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nsize {
  /// Screen Size
  static final double screenwidth = MediaQuery.of(Get.context!).size.width;
  static final double screenheight = MediaQuery.of(Get.context!).size.height;
  // WidgetsBinding
  //     .instance.platformDispatcher.views.first.physicalSize.height

  /// Icon Size
  static const double prifixicon = 26.0;
  static const double labletextfont = 18.0;

  ///Space Between widgets
  static const double spaceBetweenTextField = 12.0;
}
