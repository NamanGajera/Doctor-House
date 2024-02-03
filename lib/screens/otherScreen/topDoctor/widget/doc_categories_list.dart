import 'package:dr_house/controller/homeScreenController/homeScreen/homescreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/const/images.dart';
import '../../../../utils/const/list.dart';
import '../../../../utils/const/size.dart';
import '../../../home/homeScreen/widgets/doctor_card.dart';

class DocCatagoriesList extends StatelessWidget {
  const DocCatagoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 8, right: 12, left: 12),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: Nlist.doclist.length,
          itemBuilder: (context, index) {
            if (controller.currentCategoriesIndex.value == 0) {
              return DoctorCard(
                borderradius: 18,
                cardHeight: Nsize.screenheight * 0.13,
                imageHeight: Nsize.screenheight * 0.21,
                imageWidth: Nsize.screenwidth * 0.23,
                elevation: 8,
                cardWidth: double.infinity,
                imagePath: Nimages.docProfile,
                doctorName: Nlist.doclist[index]['name'],
                doctorType: Nlist.doclist[index]['type'],
                docnamefontSize: 20,
                docntypefontSize: 14,
                ratting: Nlist.doclist[index]['ratting'].toString(),
                stariconSize: 20,
                cityName: Nlist.doclist[index]['city'],
                id: Nlist.doclist[index]['id'],
                onTap: () {
                  controller.openDoctorDetails(
                    Nlist.doclist[index]['name'],
                    Nlist.doclist[index]['type'],
                    Nlist.doclist[index]['city'],
                    Nlist.doclist[index]['degree'],
                    Nlist.doclist[index]['details'],
                    Nlist.doclist[index]['id'],
                  );
                },
              );
            } else {
              if (Nlist.doctorCategories[
                      controller.currentCategoriesIndex.value] ==
                  Nlist.doclist[index]['type']) {
                return DoctorCard(
                  borderradius: 18,
                  cardHeight: Nsize.screenheight * 0.12,
                  imageHeight: Nsize.screenheight * 0.2,
                  imageWidth: Nsize.screenwidth * 0.22,
                  elevation: 8,
                  cardWidth: double.infinity,
                  imagePath: Nimages.docProfile,
                  doctorName: Nlist.doclist[index]['name'],
                  doctorType: Nlist.doclist[index]['type'],
                  docnamefontSize: 20,
                  docntypefontSize: 14,
                  ratting: Nlist.doclist[index]['ratting'].toString(),
                  stariconSize: 20,
                  cityName: Nlist.doclist[index]['city'],
                  id: Nlist.doclist[index]['id'],
                  onTap: () {
                    controller.openDoctorDetails(
                      Nlist.doclist[index]['name'],
                      Nlist.doclist[index]['type'],
                      Nlist.doclist[index]['city'],
                      Nlist.doclist[index]['degree'],
                      Nlist.doclist[index]['details'],
                      Nlist.doclist[index]['id'],
                    );
                  },
                );
              }
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
