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
        color: Color.fromARGB(255, 255, 251, 250),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image(
                image: AssetImage(methodIcon),
                height: Nsize.screenheight * 0.015,
                width: Nsize.screenheight * 0.015,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 15),
              Text(
                methodname,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              changebtn
                  ? TextButton(
                      onPressed: changeOnTap,
                      child: Text('Change'),
                    )
                  : Obx(
                      () => Container(
                        alignment: Alignment.center,
                        height: Nsize.screenheight * 0.01,
                        width: Nsize.screenheight * 0.008,
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
