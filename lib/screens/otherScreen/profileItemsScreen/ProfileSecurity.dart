import 'package:dr_house/controller/homeScreenController/homeScreen/profileScreenController.dart';
import 'package:dr_house/screens/otherScreen/profileItemsScreen/widget/profileNotificationContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/const/colors.dart';

class ProfileSecurity extends StatelessWidget {
  const ProfileSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileScreenController());
    return Scaffold(
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
                title: 'Remember Me',
                val: controller.rememberVal.value,
                onChanged: (val) {
                  controller.rememberVal.value = val;
                },
              ),
            ),
            const SizedBox(height: 15),
            Obx(
              () => ProfileNotificationContainer(
                title: 'Two step verification',
                val: controller.verificationVal.value,
                onChanged: (val) {
                  controller.verificationVal.value = val;
                },
              ),
            ),
            const SizedBox(height: 15),
            Obx(
              () => ProfileNotificationContainer(
                title: 'Biometric ID',
                val: controller.biometricVal.value,
                onChanged: (val) {
                  controller.biometricVal.value = val;
                },
              ),
            ),
            const SizedBox(height: 22),
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Ncolor.darkblue2.withOpacity(0.4),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Ncolor.darkblue2),
              ),
              child: Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Ncolor.darkblue2.withOpacity(0.4),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Ncolor.darkblue2),
              ),
              child: Text(
                'Change Email',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
