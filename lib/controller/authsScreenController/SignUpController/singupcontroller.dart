import 'package:dr_house/screens/auth/loginScreen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final confpasscontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  goToLoginScreen() {
    Get.to(const LoginScreen());
  }
}
