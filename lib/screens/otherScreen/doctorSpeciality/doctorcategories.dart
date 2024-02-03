import 'package:dr_house/common/appbar/appbar.dart';
import 'package:dr_house/controller/homeScreenController/homeScreen/homescreenController.dart';
import 'package:dr_house/screens/home/homeScreen/widgets/doctor_card.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/const/images.dart';
import '../../../utils/const/list.dart';
import '../../../utils/const/size.dart';

class DoctorCategories extends StatelessWidget {
  const DoctorCategories({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        appBar: Nappbar.appbar(title),
        backgroundColor: Ncolor.lightCream,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 1),

              /// Doctor Details
              Expanded(
                child: ListView.separated(
                    itemCount: Nlist.doclist.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (title == Nlist.doclist[index]['type']) {
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
                      } else {
                        return const SizedBox();
                      }
                    },
                    separatorBuilder: (context, index) {
                      if (title == Nlist.doclist[index]['type']) {
                        return const SizedBox(height: 10);
                      } else {
                        return const SizedBox();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
