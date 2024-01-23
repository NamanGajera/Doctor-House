// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/otherScreenController/booking_controller.dart';
import '../../../../utils/const/colors.dart';

class PaymentPatientDetails extends StatelessWidget {
  const PaymentPatientDetails({
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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Patient Name
            Row(
              children: [
                const Text(
                  'Patient Name',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Text(
                  controller.patientName,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Ncolor.lightblacktext,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Bookin Date
            Row(
              children: [
                const Text(
                  'Date',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Text(
                  controller.date,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Ncolor.lightblacktext,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Booking Time
            Row(
              children: [
                const Text(
                  'Time',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Text(
                  controller.time,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Ncolor.lightblacktext,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
