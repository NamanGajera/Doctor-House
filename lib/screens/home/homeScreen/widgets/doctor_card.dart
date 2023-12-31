// ignore_for_file: must_be_immutable

import 'package:dr_house/controller/homeScreenController/homeScreen/homescreenController.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
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
    this.onTap,
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
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderradius),
        ),
        color: Ncolor.lightCream,
        child: Container(
          padding: const EdgeInsets.all(8),
          height: cardHeight,
          width: cardWidth,
          child: Row(
            children: [
              /// Doctor Image
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image(
                  image: AssetImage(imagePath),
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),

                    /// Doctor Name
                    Expanded(
                      child: Text(
                        doctorName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: docnamefontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    /// Doctor Type
                    Expanded(
                      child: Text(
                        doctorType,
                        style: TextStyle(
                          fontSize: docntypefontSize,
                          color: Ncolor.lightblacktext,
                        ),
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
                        Expanded(
                          child: Text(
                            cityName,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Ncolor.lightblacktext,
                            ),
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
                        Expanded(
                          child: Text(
                            ratting,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Ncolor.lightblacktext,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),

              // const Spacer(),

              /// Favorite Icon
              Container(
                alignment: Alignment.topCenter,
                // width: Nsize.screenwidth * 0.01,
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
            ],
          ),
        ),
      ),
    );
  }
}
