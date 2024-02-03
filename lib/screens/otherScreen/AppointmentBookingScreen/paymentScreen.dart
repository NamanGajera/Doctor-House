// ignore_for_file: file_names

import 'package:dr_house/common/appbar/appbar.dart';
import 'package:dr_house/controller/otherScreenController/booking_controller.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:dr_house/utils/helper/function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/buttons/simplebutton.dart';
import '../../../utils/const/list.dart';
import 'widget/paymentMethods.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    int checkIndex = 6;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar('Payment'),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'Select the payment method you want to use',
                style: TextStyle(
                  fontSize: 16,
                  color: Ncolor.lightblacktext,
                ),
              ),
              const SizedBox(height: 15),

              /// Payment Method
              for (int i = 0; i < 5; i++)
                PaymentMethods(
                  methodIcon: Nlist.paymentMethodIcon[i],
                  methodname: Nlist.paymentMethodname[i],
                  paymentindex: i,
                  changebtn: false,
                  onTap: () {
                    controller.currentpaymentindex.value = i;
                    checkIndex = controller.currentpaymentindex.value;
                  },
                ),
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
                    if (checkIndex > 0 && checkIndex < 6) {
                      controller.openReviewSummary(
                        Nlist.paymentMethodIcon[checkIndex],
                        Nlist.paymentMethodname[checkIndex],
                      );
                    } else {
                      Nhelper.errorSnackBar(
                          title: 'Error',
                          message: 'Select At Least One Option');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
