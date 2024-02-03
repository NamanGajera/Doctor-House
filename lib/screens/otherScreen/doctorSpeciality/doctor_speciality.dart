import 'package:dr_house/controller/homeScreenController/homeScreen/homescreenController.dart';
import 'package:dr_house/screens/home/homeScreen/widgets/doctor_card.dart';
import 'package:dr_house/screens/home/homeScreen/widgets/heading.dart';
import 'package:dr_house/common/gridview/doctortypes_icon.dart';
import 'package:dr_house/utils/const/images.dart';
import 'package:dr_house/utils/const/list.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:dr_house/utils/const/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/appbar/appbar.dart';
import '../../../utils/const/colors.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar(Ntext.docSpeciality),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 10),

                /// Doctor Speciality
                DoctorTypesIcon(
                  hightofGridView: Nsize.screenheight * 0.43,
                  itemCount: Nlist.docTypeName.length,
                  crossAxisCount: 4,
                  iconimg: Nlist.docTypeIcon,
                  iconName: Nlist.docTypeName,
                  fontsize: 14,
                  circlesize: Nsize.screenheight * 0.075,
                  imgheight: Nsize.screenheight * 0.06,
                  imgwidth: Nsize.screenheight * 0.06,
                ),

                /// Top Doctor
                Heading(
                  heading: Ntext.topDoc,
                  wantseebtn: false,
                  headingFontSize: 20,
                ),
                const SizedBox(height: 10),
                for (int i = 0; i <= 4; i++)
                  DoctorCard(
                    borderradius: 18,
                    cardHeight: Nsize.screenheight * 0.12,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
