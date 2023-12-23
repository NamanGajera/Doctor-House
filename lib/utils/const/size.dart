import 'package:flutter/material.dart';

class Nsize {
  static final double screenwidth =
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
  static final double screenheight = WidgetsBinding
      .instance.platformDispatcher.views.first.physicalSize.height;
}
