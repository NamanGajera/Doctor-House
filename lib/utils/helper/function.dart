import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Nhelper {
  static hideKeybord(event) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static showSnackbar({
    required title,
    message = '',
    duration = 2,
    backgroundColor,
    colorText,
  }) {
    Get.snackbar(
      title!,
      message!,
      backgroundColor: backgroundColor,
      colorText: colorText,
      padding: const EdgeInsets.all(16),
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
    );
  }

  static simpleSnackBar({required title, message = '', duration = 2}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Ncolor.darkblue1,
      backgroundColor: Ncolor.darkblue4,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
    );
  }

  static shortSnackBar({required title, message = '', duration = 1}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Ncolor.darkblue1,
      backgroundColor: Ncolor.darkblue4,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
    );
  }

  static successSnackBar({required title, message = '', duration = 2}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Ncolor.darkblue1,
      backgroundColor: Ncolor.coolgreen,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(
        Iconsax.check,
        color: Ncolor.darkblue1,
      ),
    );
  }

  static errorSnackBar({required title, message = '', duration = 2}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Ncolor.lightblacktext,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(
        Iconsax.warning_2,
        color: Ncolor.lightblacktext,
      ),
    );
  }
}
