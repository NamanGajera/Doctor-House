import 'package:dr_house/screens/auth/signupScreen/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  goToSignUpScreen() {
    Get.to(const SignUpScreen());
  }
}
