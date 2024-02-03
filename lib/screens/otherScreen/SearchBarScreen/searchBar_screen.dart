// ignore_for_file: file_names

import 'package:dr_house/common/appbar/appbar.dart';
import 'package:dr_house/controller/homeScreenController/homeScreen/homescreenController.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/textfield/textfield.dart';
import '../../../utils/const/images.dart';
import '../../home/homeScreen/widgets/doctor_card.dart';

class SearchBarScreen extends StatelessWidget {
  const SearchBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar('Search Doctor'),
        body: SizedBox(
          height: Nsize.screenheight,
          width: Nsize.screenwidth,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 10),

                /// Search Bar
                NtextField(
                  controller: controller.searchController,
                  bordercolor: Ncolor.darkblue1,
                  labelText: 'Search',
                  icon: Iconsax.search_favorite_1,
                  onChanged: (value) {
                    controller.searchdoctor(value);
                  },
                ),

                /// Body Part
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.searchlist.length,
                      itemBuilder: (context, index) {
                        return DoctorCard(
                          borderradius: 18,
                          cardHeight: Nsize.screenheight * 0.16,
                          imageHeight: Nsize.screenheight * 0.2,
                          imageWidth: Nsize.screenwidth * 0.22,
                          elevation: 8,
                          cardWidth: double.infinity,
                          imagePath: Nimages.docProfile,
                          doctorName: controller.searchlist[index]['name'],
                          doctorType: controller.searchlist[index]['type'],
                          docnamefontSize: 20,
                          docntypefontSize: 14,
                          ratting: controller.searchlist[index]['ratting'],
                          stariconSize: 20,
                          cityName: controller.searchlist[index]['city'],
                          id: controller.searchlist[index]['id'],
                          onTap: () {
                            controller.openDoctorDetails(
                              controller.searchlist[index]['name'],
                              controller.searchlist[index]['type'],
                              controller.searchlist[index]['city'],
                              controller.searchlist[index]['degree'],
                              controller.searchlist[index]['details'],
                              controller.searchlist[index]['id'],
                            );
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
