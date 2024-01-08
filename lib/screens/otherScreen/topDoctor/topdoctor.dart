import 'package:dr_house/screens/home/homeScreen/widgets/doctor_card.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/list.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:dr_house/utils/const/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/appbar/appbar.dart';
import '../../../controller/homeScreenController/homeScreen/homescreenController.dart';
import '../../../utils/const/images.dart';
import 'widget/doc_categories_list.dart';

class TopDoctor extends StatelessWidget {
  const TopDoctor({super.key});

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
              const DocCatagoriesList(),

              /// Doctor List

              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 8, right: 12, left: 12),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: Nlist.doclist.length,
                    itemBuilder: (context, index) {
                      return DoctorCard(
                        borderradius: 18,
                        cardHeight: Nsize.screenheight * 0.06,
                        imageHeight: Nsize.screenheight * 0.1,
                        imageWidth: Nsize.screenwidth * 0.11,
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
                        onTap: () {
                          controller.openDoctorDetails(
                            Nlist.doclist[index]['name'],
                            Nlist.doclist[index]['type'],
                            Nlist.doclist[index]['city'],
                            Nlist.doclist[index]['degree'],
                            Nlist.doclist[index]['details'],
                          );
                        },
                      );
                    },
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
