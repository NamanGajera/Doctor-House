import 'package:dr_house/screens/auth/signupScreen/signupScreen.dart';
import 'package:dr_house/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/helper/function.dart';
import '../../../utils/local_storage/local_storage.dart';

class LoginController extends GetxController {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final loginFormkey = GlobalKey<FormState>();
  RxBool obscureText = true.obs;
  final _auth = FirebaseAuth.instance;
  final deviceStorage = GetStorage();
  final RxBool loading = false.obs;

  goToSignUpScreen() {
    Get.to(() => const SignUpScreen());
  }

  showandHidePassword() {
    obscureText.value = !obscureText.value;
  }

  logIn() async {
    try {
      if (!loginFormkey.currentState!.validate()) return;
      loading.value = true;
      await _auth
          .signInWithEmailAndPassword(
        email: usernamecontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      )
          .then(
        (value) async {
          await NLocalStorage.init(_auth.currentUser!.uid);
          loading.value = false;
          Nhelper.successSnackBar(title: 'Successfully', message: 'Login');
          Get.offAll(() => const MainHomeScreen());
        },
      ).onError((error, stackTrace) {
        Nhelper.errorSnackBar(title: 'Error', message: error.toString());
        loading.value = false;
      });
    } catch (e) {
      Nhelper.errorSnackBar(title: 'Error', message: e.toString());
      loading.value = false;
    }
  }
}
