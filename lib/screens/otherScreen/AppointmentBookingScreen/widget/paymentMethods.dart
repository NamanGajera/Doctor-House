// ignore_for_file: file_names

import 'package:dr_house/controller/otherScreenController/booking_controller.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/const/size.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    super.key,
    required this.methodIcon,
    required this.methodname,
    required this.paymentindex,
    this.onTap,
    this.changeOnTap,
    required this.changebtn,
  });
  final String methodname;
  final String methodIcon;
  final int paymentindex;
  final Function()? onTap;
  final Function()? changeOnTap;
  final bool changebtn;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    return InkWell(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 255, 251, 250),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              /// Payment method icon
              Image(
                image: AssetImage(methodIcon),
                height: Nsize.screenheight * 0.035,
                width: Nsize.screenheight * 0.035,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 15),

              /// Method Name
              Text(
                methodname,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const Spacer(),

              /// Radio button
              changebtn
                  ? TextButton(
                      onPressed: changeOnTap,
                      child: const Text('Change'),
                    )
                  : Obx(
                      () => Container(
                        alignment: Alignment.center,
                        height: Nsize.screenheight * 0.022,
                        width: Nsize.screenheight * 0.018,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentpaymentindex.value ==
                                  paymentindex
                              ? Ncolor.darkblue2
                              : null,
                          border: Border.all(
                            width: 1.5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}
