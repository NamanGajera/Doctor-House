import 'package:dr_house/screens/auth/loginScree/loginScreen.dart';
import 'package:dr_house/screens/auth/signupScreen/signupScreen.dart';
import 'package:get/get.dart';

class OnBordingController extends GetxController {
  goToLoginScreen() {
    Get.offAll(const LoginScreen());
  }

  goTosignUpScreen() {
    Get.offAll(const SignUpScreen());
  }
}
