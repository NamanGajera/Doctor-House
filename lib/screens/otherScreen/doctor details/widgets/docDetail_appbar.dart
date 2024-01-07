import 'package:dr_house/controller/homeScreenController/homeScreen/homescreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/const/colors.dart';

class DocDetailsAppBar {
  static PreferredSizeWidget appbar() {
    final controller = Get.put(HomeScreenController());
    return AppBar(
      elevation: 3,
      title: const Text(
        'Doctor Details',
        style: TextStyle(color: Colors.black),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      backgroundColor: Ncolor.lightCream,
      actions: [
        Obx(
          () => IconButton(
            onPressed: controller.addToFavorite,
            icon: Icon(
              controller.addfavorite.value
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: controller.addfavorite.value ? Colors.red : Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}
