import 'package:dr_house/controller/homeScreenController/homeScreen/homescreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/gridview/doctortypes_icon.dart';
import '../../../../utils/const/images.dart';
import '../../../../utils/const/list.dart';
import '../../../../utils/const/size.dart';
import '../../../../utils/const/text.dart';
import '../../../otherScreen/doctorSpeciality/doctor_speciality.dart';
import '../../../otherScreen/topDoctor/topdoctor.dart';
import 'doctor_card.dart';
import 'heading.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Column(
      children: [
        /// Doctor Speciality Heading
        Heading(
          heading: Ntext.docSpeciality,
          headingFontSize: 22,
          wantseebtn: true,
          seeall: Ntext.seeall,
          seeallFontSize: 16,
          onTap: () {
            Get.to(() => const DoctorSpeciality());
          },
        ),
        const SizedBox(height: 10),

        /// Doctor Speciality
        DoctorTypesIcon(
          hightofGridView: Nsize.screenheight * 0.22,
          crossAxisCount: 4,
          itemCount: 8,
          iconimg: Nlist.docTypeIcon,
          iconName: Nlist.docTypeName,
          fontsize: 14,
          circlesize: Nsize.screenheight * 0.07,
          imgheight: Nsize.screenheight * 0.05,
          imgwidth: Nsize.screenheight * 0.05,
        ),

        const SizedBox(height: 15),

        /// Top Doctor Heading
        Heading(
          heading: Ntext.topDoc,
          wantseebtn: true,
          headingFontSize: 22,
          seeall: Ntext.seeall,
          seeallFontSize: 16,
          onTap: () {
            Get.to(() => const TopDoctor());
          },
        ),
        const SizedBox(height: 10),

        /// Doctor 1 Details
        for (int i = 0; i < 4; i++)
          DoctorCard(
            borderradius: 18,
            cardHeight: Nsize.screenheight * 0.15,
            imageHeight: Nsize.screenheight * 0.2,
            imageWidth: Nsize.screenwidth * 0.22,
            elevation: 8,
            cardWidth: double.infinity,
            imagePath: Nimages.docProfile,
            doctorName: Nlist.doclist[i]['name'],
            doctorType: Nlist.doclist[i]['type'],
            docnamefontSize: 20,
            docntypefontSize: 14,
            ratting: Nlist.doclist[i]['ratting'].toString(),
            stariconSize: 20,
            cityName: Nlist.doclist[i]['city'],
            id: Nlist.doclist[i]['id'],
            onTap: () {
              controller.openDoctorDetails(
                Nlist.doclist[i]['name'],
                Nlist.doclist[i]['type'],
                Nlist.doclist[i]['city'],
                Nlist.doclist[i]['degree'],
                Nlist.doclist[i]['details'],
                Nlist.doclist[i]['id'],
              );
            },
          ),
        const SizedBox(height: 18),

        /// Our Service Heading

      ],
    );
  }
}
