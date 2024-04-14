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
    required this.id,
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
  final String id;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: elevation,
        surfaceTintColor: Colors.transparent,
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

              /// Doctor Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// Doctor Name
                    Flexible(
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
                    Flexible(
                      child: Text(
                        doctorType,
                        style: TextStyle(
                          fontSize: docntypefontSize,
                          color: Ncolor.lightblacktext,
                        ),
                      ),
                    ),

                    /// Location
                    Row(
                      children: [
                        const Icon(
                          Iconsax.location,
                          size: 16,
                          color: Ncolor.darkblue1,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
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

                    /// Ratting
                    Row(
                      children: [
                        Icon(
                          Iconsax.star,
                          size: stariconSize,
                          color: Ncolor.darkblue1,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
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

              /// Favorite Icon
              Container(
                alignment: Alignment.topCenter,
                child: Obx(
                  () => IconButton(
                    onPressed: () {
                      controller.toggelFavorites(id);
                    },
                    icon: Icon(
                      controller.isFavorites(id)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: controller.isFavorites(id)
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
