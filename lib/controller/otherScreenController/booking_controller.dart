import 'package:dr_house/screens/otherScreen/AppointmentBookingScreen/appointment_booking_screen.dart';
import 'package:dr_house/screens/otherScreen/AppointmentBookingScreen/patientDetails.dart';
import 'package:dr_house/screens/otherScreen/AppointmentBookingScreen/reviewSummeary.dart';
import 'package:dr_house/utils/const/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/otherScreen/AppointmentBookingScreen/paymentScreen.dart';

class BookingController extends GetxController {
  RxInt currentindex = 0.obs;
  RxInt currentpaymentindex = 6.obs;
  String doctorName = '';
  String doctorImage = Nimages.docProfile;
  String doctorType = '';
  String doctorCity = '';
  String doctorRatting = '4.2';
  String time = '';
  String date =
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  String patientName = '';
  String patientAge = '';
  final patientFormKey = GlobalKey<FormState>();
  final fullnamecontroller = TextEditingController();
  final ageController = TextEditingController();

  openBookAppointment() {
    Get.to(() => const AppointmentBookingScreen());
  }

  selecttime(int index) {
    currentindex.value = index;
  }

  openPatientDetails() {
    Get.to(() => const PatientDetails());
  }

  openPaymentScreen() {
    Get.off(() => PaymentScreen());
  }

  changePaymentMethod() {
    Get.off(() => PaymentScreen());
  }

  openReviewSummary(
    String methodIcon,
    String methodName,
  ) {
    Get.to(() => ReviewSummary(
          paymentMethodIcon: methodIcon,
          paymentNethodName: methodName,
        ));
  }
}
