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
                NtextField(
                  controller: controller.searchController,
                  bordercolor: Ncolor.darkblue1,
                  labelText: 'Search',
                  icon: Iconsax.search_favorite_1,
                  onChanged: (value) {
                    controller.searchdoctor(value);
                  },
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.searchlist.length,
                      itemBuilder: (context, index) {
                        return DoctorCard(
                          borderradius: 18,
                          cardHeight: Nsize.screenheight * 0.06,
                          imageHeight: Nsize.screenheight * 0.1,
                          imageWidth: Nsize.screenwidth * 0.11,
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

// Expanded(
//                   child: Obx(
//                     () => StreamBuilder(
//                       stream: doctorData,
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return Center(
//                             child: CircularProgressIndicator(
//                               color: Ncolor.darkblue1,
//                             ),
//                           );
//                         } else if (snapshot.hasError) {
//                           return const Center(child: Text('Some Error'));
//                         } else {
//                           return ListView.builder(
//                             physics: const BouncingScrollPhysics(),
//                             itemCount: snapshot.data!.docs.length,
//                             itemBuilder: (context, index) {
//                               final id =
//                                   snapshot.data!.docs[index]['id'].toString();
                              
//                             },
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ),
              
