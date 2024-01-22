import 'package:dr_house/screens/auth/loginScreen/loginScreen.dart';
import 'package:dr_house/utils/helper/function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpController extends GetxController {
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final confpasscontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final signupFormkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance.collection('Users');
  final RxBool loading = false.obs;

  goToLoginScreen() {
    Get.to(() => const LoginScreen());
  }

  sigup() async {
    try {
      // Validation
      if (!signupFormkey.currentState!.validate()) return;

      loading.value = true;
      // Register user in FireBase
      await _auth
          .createUserWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      )
          .then(
        (value) {
          Nhelper.successSnackBar(title: 'Successfully', message: 'Register');
          Get.off(() => const LoginScreen());
          loading.value = false;
        },
      ).onError((error, stackTrace) {
        Nhelper.errorSnackBar(title: 'Error', message: error.reactive);
        loading.value = false;
      });

      // save user data
      final User? user = _auth.currentUser;
      final uid = user?.uid;

      await _db.doc(uid).set({
        'id': uid,
        'name': usernamecontroller.text.trim(),
        'email': emailcontroller.text.trim(),
        'phone': phonecontroller.text.trim(),
        'password': passwordcontroller.text.trim(),
      }).onError(
        (error, stackTrace) =>
            Nhelper.errorSnackBar(title: 'Error', message: error.reactive),
      );
    } catch (e) {
      Nhelper.errorSnackBar(title: 'Error', message: e.toString());
      loading.value = false;
    }
  }
}
