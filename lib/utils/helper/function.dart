import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nhelper {
  static hideKeybord(event) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static showSnackbar(
      String? title, String message, Color? backgroundColor, Color? colorText) {
    Get.snackbar(
      title!,
      message,
      backgroundColor: backgroundColor,
      colorText: colorText,
      padding: const EdgeInsets.all(16),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(milliseconds: 700),
    );
  }
}
