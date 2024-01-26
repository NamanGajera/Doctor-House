import 'package:dr_house/screens/otherScreen/AppointmentBookingScreen/book_appointment.dart';
import 'package:dr_house/screens/otherScreen/AppointmentBookingScreen/patientDetails.dart';
import 'package:dr_house/screens/otherScreen/AppointmentBookingScreen/reviewSummeary.dart';
import 'package:dr_house/utils/const/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/otherScreen/AppointmentBookingScreen/paymentScreen.dart';
import '../../utils/const/list.dart';
import '../../utils/helper/function.dart';

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
  RxString gender = 'Male'.obs;
  String currentHour = '${DateTime.now().hour}:${DateTime.now().minute}';
  int currenttimeindex = 0;
  bool isValidTime = true;

  openBookAppointment() {
    Get.to(() => const BookAppointmentScreen());
  }

  selecttime(int index) {
    currentindex.value = index;
  }

  openPatientDetails() {
    Get.to(() => const PatientDetails());
  }

  openPaymentScreen() {
    Get.off(() => const PaymentScreen());
  }

  changePaymentMethod() {
    Get.off(() => const PaymentScreen());
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

  checkTimeSlot() {
    var s1 = Nlist.timeSlot[currenttimeindex];
    var s2 = '${DateTime.now().hour}:${DateTime.now().minute}';

    var t1 = DateTime.parse('2000-01-01 $s1');
    var t2 = DateTime.parse('2000-01-01 $s2');
    isValidTime = t1.isAfter(t2);
  }

  nextToPatientDetails() {
    time = Nlist.timeSlot[currenttimeindex];
    checkTimeSlot();
    if (isValidTime) {
      openPatientDetails();
    } else {
      Nhelper.errorSnackBar(
          title: 'Error', message: 'This Time Sloat Not Available Right Now!!');
    }
  }
}
