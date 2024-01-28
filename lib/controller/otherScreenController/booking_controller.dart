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
  DateTime selectedDate = DateTime.now();
  String date =
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  String patientName = '';
  String patientAge = '';
  String patientProblem = '';
  final patientFormKey = GlobalKey<FormState>();
  final fullnamecontroller = TextEditingController();
  final ageController = TextEditingController();
  final problemController = TextEditingController();
  RxString gender = 'Male'.obs;
  // String currentHour = '${DateTime.now().hour}:${DateTime.now().minute}';
  int currenttimeindex = 0;
  bool isValidTime = true;
  RxBool bookingloading = false.obs;

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
    var t1 = DateTime.parse("2023-12-23 $s1");
    var t = selectedDate.copyWith(hour: t1.hour, minute: t1.minute);
    var s = DateTime.now();
    isValidTime = t.isAfter(s);
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
