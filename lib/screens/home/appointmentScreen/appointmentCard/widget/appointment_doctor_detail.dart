import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/const/colors.dart';
import '../../../../../utils/const/size.dart';

class AppointmentDoctorDetails extends StatelessWidget {
  const AppointmentDoctorDetails({
    super.key,
    required this.docImage,
    required this.docName,
    required this.docCity,
    required this.bookingId,
  });

  final String docImage;
  final String? docName;
  final String? docCity;
  final String bookingId;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Doctor Image
        ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: Image(
            image: AssetImage(docImage),
            fit: BoxFit.cover,
            height: Nsize.screenheight * 0.1,
            width: Nsize.screenheight * 0.1,
          ),
        ),
        const SizedBox(width: 12),

        /// Doctor Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),

              /// Doctor Name
              Text(
                docName!,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),

              /// Doctor City
              Row(
                children: [
                  const Icon(
                    Iconsax.location,
                    size: 18,
                    color: Ncolor.darkblue1,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      docCity!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Ncolor.lightblacktext,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              /// Booking Id
              Row(
                children: [
                  const Icon(
                    Iconsax.card,
                    size: 18,
                    color: Ncolor.darkblue1,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Booking Id : $bookingId',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Ncolor.lightblacktext,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
