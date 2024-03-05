import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/list.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:dr_house/utils/const/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/appbar/appbar.dart';
import '../../../controller/homeScreenController/homeScreen/homescreenController.dart';
import '../../../utils/const/images.dart';
import '../../home/homeScreen/widgets/doctor_card.dart';

class TopDoctor extends StatefulWidget {
  const TopDoctor({super.key});

  @override
  State<TopDoctor> createState() => _TopDoctorState();
}

class _TopDoctorState extends State<TopDoctor> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar(Ntext.topDoc),
        body: SizedBox(
          height: Nsize.screenheight - MediaQuery.of(context).padding.top,
          width: Nsize.screenwidth,
          child: Column(
            children: [
              const SizedBox(height: 10),

              ///Doctor Catagories List
              SizedBox(
                height: Nsize.screenheight * 0.04,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: Nlist.doctorCategories.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.currentCategoriesIndex.value = index;
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: Nsize.screenheight * 0.04,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, right: 10, left: 10),
                          margin: const EdgeInsets.only(right: 2, left: 8),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(18),
                            color:
                                controller.currentCategoriesIndex.value == index
                                    ? Ncolor.darkblue3
                                    : Ncolor.lightCream,
                          ),
                          child: Text(
                            Nlist.doctorCategories[index],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              /// Doctor List
              Expanded(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
