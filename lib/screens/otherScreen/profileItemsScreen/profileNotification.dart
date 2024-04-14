import 'package:dr_house/controller/homeScreenController/homeScreen/profileScreenController.dart'
    show ProfileScreenController;
import 'package:dr_house/screens/otherScreen/profileItemsScreen/widget/profileNotificationContainer.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileNotification extends StatelessWidget {
  const ProfileNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileScreenController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Ncolor.lightCream,
      appBar: AppBar(
        title: const Text('Notification'),
        elevation: 0,
        backgroundColor: Ncolor.lightCream,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Obx(
              () => ProfileNotificationContainer(
                title: 'Notification',
                val: controller.notificationVal.value,
                onChanged: (val) {
                  controller.notificationVal.value = val;
                },
              ),
            ),
            const SizedBox(height: 15),
            Obx(
              () => ProfileNotificationContainer(
                title: 'Sound',
                val: controller.soundVal.value,
                onChanged: (val) {
                  controller.soundVal.value = val;
                },
              ),
            ),
            const SizedBox(height: 15),
            Obx(
              () => ProfileNotificationContainer(
                title: 'Vibrate',
                val: controller.vibrateVal.value,
                onChanged: (val) {
                  controller.vibrateVal.value = val;
                },
              ),
            ),
            const SizedBox(height: 15),
            Obx(
              () => ProfileNotificationContainer(
                title: 'Payments',
                val: controller.paymentVal.value,
                onChanged: (val) {
                  controller.paymentVal.value = val;
                },
              ),
            ),
            const SizedBox(height: 15),
            Obx(
              () => ProfileNotificationContainer(
                title: 'App Updates',
                val: controller.updateVal.value,
                onChanged: (val) {
                  controller.updateVal.value = val;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
