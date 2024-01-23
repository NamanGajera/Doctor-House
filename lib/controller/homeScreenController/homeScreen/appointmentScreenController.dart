// ignore_for_file: file_names

import 'package:get/get.dart';

class AppointmentScreenController extends GetxController {
  RxInt pageindex = 0.obs;
  RxBool switchvalue = true.obs;

  changeSwitchValue(bool value) {
    switchvalue.value = value;
  }
}
