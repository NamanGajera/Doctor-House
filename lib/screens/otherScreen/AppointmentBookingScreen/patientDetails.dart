// ignore_for_file: file_names

import 'package:dr_house/common/appbar/appbar.dart';
import 'package:dr_house/common/buttons/simplebutton.dart';
import 'package:dr_house/controller/otherScreenController/booking_controller.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'widget/patientDetailsForm.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingcontroller = Get.put(BookingController());

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar('Patient Details'),
        body: SizedBox(
          height: Nsize.screenheight,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Expanded(
                  child: SingleChildScrollView(
                    child: const PatientDetailForm(),
                  ),
                ),
          const SizedBox(height: 15,),
                /// Next Button

              ],
            ),
          ),
        ),
        bottomSheet:  Container(
          height: Nsize.screenheight * 0.06,
          width: Nsize.screenwidth,
          margin: const EdgeInsets.all(10),
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
                bookingcontroller.patientProblem =
                    bookingcontroller.problemController.text.toString();
              }
            },
          ),
        ),
      ),
    );
  }
}
