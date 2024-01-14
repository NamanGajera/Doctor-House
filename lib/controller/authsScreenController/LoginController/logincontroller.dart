import 'package:dr_house/screens/auth/signupScreen/signupScreen.dart';
import 'package:dr_house/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/helper/function.dart';

class LoginController extends GetxController {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  RxBool obscureText = true.obs;
  final _auth = FirebaseAuth.instance;
  final deviceStorage = GetStorage();

  goToSignUpScreen() {
    Get.to(() => const SignUpScreen());
  }

  showandHidePassword() {
    obscureText.value = !obscureText.value;
  }

  logIn() async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: usernamecontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      )
          .then(
        (value) {
          Nhelper.successSnackBar(title: 'Successfully', message: 'Login');
          Get.offAll(() => const MainHomeScreen());
        },
      ).onError(
        (error, stackTrace) =>
            Nhelper.errorSnackBar(title: 'Error', message: error),
      );
    } catch (e) {
      Nhelper.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
