import 'package:get/get.dart';

class AppointmentScreenController extends GetxController {
  RxInt pageindex = 0.obs;
  RxBool switchvalue = true.obs;

  changeSwitchValue(bool value) {
    switchvalue.value = value;
  }
}
