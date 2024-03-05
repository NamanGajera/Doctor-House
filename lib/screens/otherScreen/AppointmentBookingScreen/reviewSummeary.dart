// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dr_house/common/appbar/appbar.dart';
import 'package:dr_house/common/dialog/showMyDialog.dart';
import 'package:dr_house/controller/otherScreenController/booking_controller.dart';
import 'package:dr_house/screens/home/appointmentScreen/appointmentscreen.dart';
import 'package:dr_house/screens/otherScreen/AppointmentBookingScreen/widget/paymentMethods.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/images.dart';
import 'package:dr_house/utils/const/list.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:dr_house/utils/const/text.dart';
import 'package:dr_house/utils/helper/function.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    final user = FirebaseAuth.instance.currentUser;
    String id = DateTime.now().millisecondsSinceEpoch.toString();

    final appointmentDB = FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .collection('AppointmentDetails')
        .doc(id);
    final controller = Get.put(BookingController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar('Review Summary'),
        body: SingleChildScrollView(
          child: SizedBox(
            height: Nsize.screenheight - Nsize.screenheight * 0.095,
            child: Padding(
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
                      height: Nsize.screenheight * 0.06,
                      width: Nsize.screenwidth,
                      child: SimpleButton(
                        height: Nsize.screenheight * 0.06,
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
                            const Duration(seconds: 1),
                            () {
                              controller.bookingloading.value = false;
                              appointmentDB.set({
                                'id': id,
                                'docName': controller.doctorName,
                                'docType': controller.doctorType,
                                'docCity': controller.doctorCity,
                                'date': controller.date,
                                'time':
                                    Nlist.timeSlot[controller.currenttimeindex],
                                'pateintName': controller.patientName,
                                'pateintAge': controller.patientAge,
                                'pateintGender': controller.gender.value,
                                'patientProblem': controller.patientProblem,
                              }).then((value) {
                                controller.bookingloading.value = false;
                                NmyDialog.showCongratulationDialog(
                                  Nimages.appointment,
                                  Ntext.congrats,
                                  Ntext.subconratsText,
                                  Ntext.viewappointment,
                                  Ntext.backbtn,
                                  () {
                                    Get.close(5);
                                    Get.to(() => const AppointmentScreen());
                                  },
                                  () {
                                    Get.close(5);
                                  },
                                );
                              }).onError(
                                (error, stackTrace) => Nhelper.errorSnackBar(
                                    title: 'Error', message: error.hashCode),
                              );
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
        ),
      ),
    );
  }
}
