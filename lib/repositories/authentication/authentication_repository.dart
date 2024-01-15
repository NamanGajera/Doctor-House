import 'package:dr_house/screens/auth/loginScreen/loginScreen.dart';
import 'package:dr_house/screens/auth/onBordingScreen/on_bording_screen.dart';
import 'package:dr_house/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticatonRepository extends GetxController {
  static AuthenticatonRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  screenRedirect() async {
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') == true
        ? Get.offAll(() => const OnBordingScreen())
        : islogin();
  }

  islogin() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Get.offAll(() => const MainHomeScreen());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }
}
