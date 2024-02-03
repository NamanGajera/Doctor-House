// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../controller/otherScreenController/booking_controller.dart';
import '../../../../utils/const/colors.dart';
import '../../../../utils/const/size.dart';

class PaymentDoctorDetails extends StatelessWidget {
  const PaymentDoctorDetails({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      color: const Color.fromARGB(255, 255, 251, 250),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Doctor Image
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image(
                image: AssetImage(controller.doctorImage),
                height: Nsize.screenheight * 0.15,
                width: Nsize.screenheight * 0.13,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),

            /// Doctor Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),

                /// Doctor Name
                Text(
                  controller.doctorName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                /// Doctor Type
                Text(
                  controller.doctorType,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Ncolor.lightblacktext,
                  ),
                ),
                const SizedBox(height: 8),

                /// Location
                Row(
                  children: [
                    const Icon(
                      Iconsax.location,
                      size: 16,
                      color: Ncolor.darkblue1,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      controller.doctorCity,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Ncolor.lightblacktext,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                /// Ratting
                Row(
                  children: [
                    const Icon(
                      Iconsax.star,
                      size: 20,
                      color: Ncolor.darkblue1,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      controller.doctorRatting,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Ncolor.lightblacktext,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            )
          ],
        ),
      ),
    );
  }
}
