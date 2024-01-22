import 'package:dr_house/screens/otherScreen/AppointmentBookingScreen/appointment_booking_screen.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  RxInt currentindex = 0.obs;

  openBookAppointment() {
    Get.to(() => const AppointmentBookingScreen());
  }

  selectmorningtime(int index) {
    currentindex.value = index;
  }

  selectafternoontime(int index) {
    currentindex.value = index;
  }
}
