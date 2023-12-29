// ignore_for_file: must_be_immutable

import 'package:dr_house/controller/homeScreenController/homeScreen/homescreenController.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DoctorCard extends StatelessWidget {
  DoctorCard({
    super.key,
    this.elevation,
    required this.borderradius,
    required this.cardHeight,
    required this.cardWidth,
    required this.imagePath,
    this.imageWidth,
    this.imageHeight,
    required this.doctorName,
    this.docnamefontSize,
    required this.doctorType,
    this.docntypefontSize,
    this.stariconSize,
    required this.ratting,
    required this.cityName,
  });

  final double? elevation;
  final double borderradius;
  final double cardHeight;
  final double cardWidth;
  final String imagePath;
  final double? imageWidth;
  final double? imageHeight;
  final String doctorName;
  final String doctorType;
  final double? docnamefontSize;
  final double? docntypefontSize;
  final double? stariconSize;
  final String ratting;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderradius),
      ),
      color: Ncolor.lightCream,
      child: SizedBox(
        height: cardHeight,
        width: cardWidth,
        child: Row(
          children: [
            /// Doctor Image
            ClipRRect(
              borderRadius: BorderRadius.circular(borderradius),
              child: Image(
                image: AssetImage(imagePath),
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),

                /// Doctor Name
                Text(
                  doctorName,
                  style: TextStyle(
                    fontSize: docnamefontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                /// Doctor Type
                Text(
                  doctorType,
                  style: TextStyle(
                    fontSize: docntypefontSize,
                    color: Ncolor.lightblacktext,
                  ),
                ),
                const SizedBox(height: 5),

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
                      cityName,
                      style: const TextStyle(
                        color: Ncolor.lightblacktext,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                /// Ratting
                Row(
                  children: [
                    Icon(
                      Iconsax.star,
                      size: stariconSize,
                      color: Ncolor.darkblue1,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      ratting,
                      style: const TextStyle(
                        color: Ncolor.lightblacktext,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),

            const Spacer(),

            /// Favorite Icon
            Container(
              alignment: Alignment.topCenter,
              child: Obx(
                () => IconButton(
                  onPressed: controller.addToFavorite,
                  icon: Icon(
                    controller.addfavorite.value
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: controller.addfavorite.value
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
