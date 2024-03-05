import 'package:flutter/material.dart';
import '../../../../utils/const/colors.dart';
import '../../../../utils/const/size.dart';
import 'widget/appointment_doctor_detail.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.dateTimeText,
    required this.docImage,
    required this.docName,
    required this.docCity,
    required this.bookingId,
    required this.canclebtn,
    this.onTap,
  });

  final String dateTimeText;
  final String docImage;
  final String? docName;
  final String? docCity;
  final String bookingId;
  final bool canclebtn;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        height:
            canclebtn ? Nsize.screenheight * 0.23 : Nsize.screenheight * 0.18,
        width: Nsize.screenwidth,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Ncolor.lightCream,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                /// Appointment Time And Date
                Text(
                  dateTimeText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1.2,
              height: 20,
            ),

            /// Doctor details
            AppointmentDoctorDetails(
              docImage: docImage,
              docName: docName,
              docCity: docCity,
              bookingId: bookingId,
            ),
            const Spacer(),

            /// Cancle Button
            canclebtn
                ? GestureDetector(
                    onTap: onTap,
                    child: Container(
                      alignment: Alignment.center,
                      height: Nsize.screenheight * 0.045,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        // color: Ncolor.darkblue2,
                        border: Border.all(
                          color: Ncolor.darkblue2,
                          width: 2.5,
                        ),
                      ),
                      child: const Text(
                        'Cancle',
                        style: TextStyle(
                          // color: Colors.Balck,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
