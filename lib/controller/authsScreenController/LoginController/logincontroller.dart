import 'package:dr_house/screens/auth/signupScreen/signupScreen.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  goToSignUpScreen() {
    Get.to(const SignUpScreen());
  }
}
