import 'package:flutter/material.dart';

import '../../utils/const/colors.dart';

class Nappbar {
  static PreferredSizeWidget appbar(String title) {
    return AppBar(
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      backgroundColor: Ncolor.lightCream,
    );
  }
}
