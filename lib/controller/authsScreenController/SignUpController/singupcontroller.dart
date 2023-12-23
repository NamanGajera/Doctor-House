import 'package:dr_house/screens/auth/loginScree/loginScreen.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  goToLoginScreen() {
    Get.off(const LoginScreen());
  }
}
