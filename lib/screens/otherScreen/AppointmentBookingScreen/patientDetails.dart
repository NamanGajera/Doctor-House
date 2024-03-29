// ignore_for_file: file_names

import 'package:dr_house/common/appbar/appbar.dart';
import 'package:dr_house/common/buttons/simplebutton.dart';
import 'package:dr_house/controller/otherScreenController/booking_controller.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/patientDetailsForm.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingcontroller = Get.put(BookingController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar('Patient Details'),
        body: SingleChildScrollView(
          child: SizedBox(
            height: Nsize.screenheight - Nsize.screenheight * 0.095,
            width: Nsize.screenwidth,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  const PatientDetailForm(),
                  const Spacer(),

                  /// Next Button
                  SizedBox(
                    height: Nsize.screenheight * 0.06,
                    width: Nsize.screenwidth,
                    child: SimpleButton(
                      height: Nsize.screenheight * 0.06,
                      width: Nsize.screenwidth,
                      applyborderRadius: true,
                      borderRadius: 24,
                      applyboxShadow: false,
                      applybold: true,
                      buttonText: 'Next',
                      backgroundColor: Ncolor.darkblue2,
                      fontSize: 22,
                      loading: false,
                      onTap: () {
                        if (bookingcontroller.patientFormKey.currentState!
                            .validate()) {
                          bookingcontroller.openPaymentScreen();
                          bookingcontroller.patientAge =
                              bookingcontroller.ageController.text.toString();
                          bookingcontroller.patientName = bookingcontroller
                              .fullnamecontroller.text
                              .toString();
                          bookingcontroller.patientProblem = bookingcontroller
                              .problemController.text
                              .toString();
                        }
                      },
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
