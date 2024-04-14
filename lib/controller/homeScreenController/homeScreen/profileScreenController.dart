// ignore_for_file: file_names

import 'package:dr_house/screens/auth/loginScreen/loginScreen.dart';
import 'package:dr_house/screens/otherScreen/profileItemsScreen/your_profile.dart';
import 'package:dr_house/utils/helper/function.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../utils/const/colors.dart';

class ProfileScreenController extends GetxController {
  final _auth = FirebaseAuth.instance;
  RxBool notificationVal = false.obs;
  RxBool soundVal = false.obs;
  RxBool vibrateVal = false.obs;
  RxBool paymentVal = false.obs;
  RxBool updateVal = false.obs;
  RxBool rememberVal = false.obs;
  RxBool verificationVal = false.obs;
  RxBool biometricVal = false.obs;

  // LogOut
  logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Conforim!',
            style: TextStyle(
              fontSize: 20,
              color: Ncolor.darkblue1,
            ),
          ),
          content: const Text(
            'Do you want to logout?',
            style: TextStyle(
              fontSize: 16,
              color: Ncolor.darkblue2,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                _auth.signOut().then((value) {
                  Get.offAll(() => const LoginScreen());
                  Nhelper.successSnackBar(title: 'Successfully Log Out');
                }).onError(
                  (error, stackTrace) => Nhelper.errorSnackBar(
                    title: 'Error',
                    message: error.toString(),
                  ),
                );
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                  fontSize: 18,
                  color: Ncolor.darkblue1,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 18,
                  color: Ncolor.darkblue1,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // open profile screen
  openProfileScreen() {
    Get.to(() => YourProfileScreen());
  }
}
