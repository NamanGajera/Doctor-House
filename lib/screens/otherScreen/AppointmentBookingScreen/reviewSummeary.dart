// ignore_for_file: file_names

import 'package:dr_house/common/appbar/appbar.dart';
import 'package:dr_house/controller/otherScreenController/booking_controller.dart';
import 'package:dr_house/screens/otherScreen/AppointmentBookingScreen/widget/paymentMethods.dart';
import 'package:dr_house/utils/const/colors.dart';
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
              const PaymentDoctorDetails(),
              const SizedBox(height: 10),
              const PaymentPatientDetails(),
              const SizedBox(height: 10),
              const PaymentAmount(),
              const SizedBox(height: 10),
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
              SizedBox(
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
                  loading: false,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
