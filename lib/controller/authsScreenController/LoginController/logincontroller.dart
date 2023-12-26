import 'package:dr_house/screens/auth/signupScreen/signupScreen.dart';
import 'package:dr_house/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  RxBool obscureText = true.obs;

  goToSignUpScreen() {
    Get.to(const SignUpScreen());
  }

  showandHidePassword() {
    obscureText.value = !obscureText.value;
  }

  gotToMainScreen() {
    Get.to(MainHomeScreen());
  }
}
