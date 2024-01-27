// ignore_for_file: file_names

import 'package:dr_house/common/appbar/appbar.dart';
import 'package:dr_house/controller/otherScreenController/booking_controller.dart';
import 'package:dr_house/screens/home/appointmentScreen/appointmentscreen.dart';
import 'package:dr_house/screens/otherScreen/AppointmentBookingScreen/widget/paymentMethods.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/images.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/buttons/simplebutton.dart';
import 'widget/paymentAmount.dart';
import 'widget/paymentDoctorDetails.dart';
import 'widget/paymentPatientDetails.dart';

class ReviewSummary extends StatelessWidget {
  const ReviewSummary({
    super.key,
    required this.paymentMethodIcon,
    required this.paymentNethodName,
  });
  final String paymentMethodIcon;
  final String paymentNethodName;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar('Review Summary'),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 10),

              /// Doctor Details
              const PaymentDoctorDetails(),
              const SizedBox(height: 10),

              /// Patient Details
              const PaymentPatientDetails(),
              const SizedBox(height: 10),

              /// Payment Amount Details
              const PaymentAmount(),
              const SizedBox(height: 10),

              /// Payment Methods
              PaymentMethods(
                methodIcon: paymentMethodIcon,
                methodname: paymentNethodName,
                paymentindex: 0,
                changebtn: true,
                changeOnTap: () {
                  controller.changePaymentMethod();
                },
              ),
              const Spacer(),

              /// Done Button
              Obx(
                () => SizedBox(
                  height: Nsize.screenheight * 0.025,
                  width: Nsize.screenwidth,
                  child: SimpleButton(
                    height: Nsize.screenheight * 0.025,
                    width: Nsize.screenwidth,
                    applyborderRadius: true,
                    borderRadius: 24,
                    applyboxShadow: false,
                    applybold: true,
                    buttonText: 'Done',
                    backgroundColor: Ncolor.darkblue2,
                    fontSize: 22,
                    loading: controller.bookingloading.value,
                    onTap: () {
                      controller.bookingloading.value = true;
                      Future.delayed(
                        const Duration(seconds: 2),
                        () {
                          controller.bookingloading.value = false;
                          showCongratulationDialog();
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showCongratulationDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Ncolor.lightCream,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          contentPadding: const EdgeInsets.all(12),
          content: SizedBox(
            height: Nsize.screenheight * 0.14,
            width: Nsize.screenwidth * 0.1,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: Nsize.screenheight * 0.04,
                  width: Nsize.screenheight * 0.04,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Ncolor.darkblue3,
                  ),
                  child: Image(
                    image: const AssetImage(Nimages.appointment),
                    color: Colors.white,
                    fit: BoxFit.cover,
                    height: Nsize.screenheight * 0.025,
                    width: Nsize.screenheight * 0.025,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 22,
                    color: Ncolor.darkblue2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Appointment successfully booked.\n You will recived a notification.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: Nsize.screenheight * 0.025,
                  width: Nsize.screenwidth,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 12, left: 12, bottom: 8),
                    child: SimpleButton(
                      height: Nsize.screenheight * 0.025,
                      width: Nsize.screenwidth,
                      applyborderRadius: true,
                      borderRadius: 24,
                      applyboxShadow: false,
                      applybold: true,
                      buttonText: 'View Appointment',
                      backgroundColor: Ncolor.darkblue3,
                      fontSize: 18,
                      loading: false,
                      onTap: () {
                        Get.close(5);
                        Get.to(() => const AppointmentScreen());
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: Nsize.screenheight * 0.025,
                  width: Nsize.screenwidth,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 12, left: 12, bottom: 8),
                    child: SimpleButton(
                      height: Nsize.screenheight * 0.025,
                      width: Nsize.screenwidth,
                      applyborderRadius: true,
                      borderRadius: 24,
                      applyboxShadow: false,
                      applybold: true,
                      buttonText: 'Back',
                      backgroundColor: Ncolor.lightCream,
                      fontSize: 18,
                      loading: false,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
