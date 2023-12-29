import 'package:dr_house/screens/home/homeScreen/widgets/doctor_card.dart';
import 'package:dr_house/screens/home/homeScreen/widgets/heading.dart';
import 'package:dr_house/screens/home/homeScreen/widgets/doctortypes_icon.dart';
import 'package:dr_house/screens/otherScreen/doctorSpeciality/doctorcategories.dart';
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
                  hightofGridView: Nsize.screenheight * 0.165,
                  itemCount: Nlist.docTypeName.length,
                  crossAxisCount: 4,
                  iconimg: Nlist.docTypeIcon,
                  iconName: Nlist.docTypeName,
                  fontsize: 14,
                  circlesize: Nsize.screenheight * 0.027,
                  imgheight: Nsize.screenheight * 0.018,
                  imgwidth: Nsize.screenheight * 0.018,
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
                    cardHeight: Nsize.screenheight * 0.06,
                    imageHeight: Nsize.screenheight * 0.1,
                    imageWidth: Nsize.screenwidth * 0.11,
                    elevation: 8,
                    cardWidth: double.infinity,
                    imagePath: Nimages.docProfile,
                    doctorName: Ntext.docName,
                    doctorType: Ntext.docCatagery,
                    docnamefontSize: 20,
                    docntypefontSize: 14,
                    ratting: '4.1',
                    stariconSize: 20,
                    cityName: 'Ahemdabad',
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
