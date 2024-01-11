// ignore_for_file: file_names

import 'package:dr_house/controller/homeScreenController/mainHome_controller.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class UserIntro extends StatelessWidget {
  const UserIntro({super.key, required this.userName, required this.intro});
  final String userName;
  final String intro;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainHomeController());
    return Row(
      children: [
        /// USer Name
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: GoogleFonts.akatab(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              intro,
              style: GoogleFonts.akatab(
                color: Ncolor.lightblacktext,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const Spacer(),

        /// Notification Icon
        Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              controller.navIndex.value = 2;
            },
            icon: const Icon(Iconsax.notification),
          ),
        ),
      ],
    );
  }
}
