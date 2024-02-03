import 'package:dr_house/controller/homeScreenController/mainHome_controller.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainHomeController());

    return Obx(
      () => Scaffold(
        backgroundColor: Ncolor.lightCream,

        /// Body
        body: controller.pages[controller.navIndex.value],

        /// Bottom Nav Bar
        bottomNavigationBar: CurvedNavigationBar(
          index: controller.navIndex.value,
          height: Nsize.screenheight * 0.06,
          items: const <Widget>[
            Icon(Iconsax.home, size: 30),
            Icon(Iconsax.calendar_1, size: 30),
            Icon(Iconsax.notification, size: 30),
            Icon(Iconsax.heart, size: 30),
            Icon(Iconsax.profile_circle, size: 30),
          ],
          color: Ncolor.lightCream,
          buttonBackgroundColor: Ncolor.darkblue3,
          backgroundColor: Ncolor.darkblue2,
          animationCurve: Curves.decelerate,
          animationDuration: const Duration(milliseconds: 500),
          letIndexChange: (index) => true,
          onTap: controller.changeIndex,
        ),
      ),
    );
  }
}
