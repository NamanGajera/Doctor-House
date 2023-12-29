import 'package:dr_house/common/textfield/textfield.dart';
import 'package:dr_house/controller/homeScreenController/homeScreen/homescreenController.dart';
import 'package:dr_house/screens/home/homeScreen/widgets/doctor_card.dart';
import 'package:dr_house/screens/home/homeScreen/widgets/userIntro.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/images.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:dr_house/utils/const/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/const/list.dart';
import 'widgets/heading.dart';
import 'widgets/icon_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    controller.onInit();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 12, left: 12),
            child: Column(
              children: [
                /// User Name and Intro
                const UserIntro(
                  userName: Ntext.userName,
                  intro: Ntext.intro,
                ),
                const SizedBox(height: 15),

                /// Search Bar
                NtextField(
                  controller: controller.searchController,
                  bordercolor: Ncolor.darkblue1,
                  labelText: 'Search',
                  icon: Iconsax.search_favorite_1,
                ),
                const SizedBox(height: 15),

                /// Doctor Speciality Heading
                Heading(
                  heading: Ntext.docSpeciality,
                  headingFontSize: 22,
                  wantseebtn: true,
                  seeall: Ntext.seeall,
                  seeallFontSize: 16,
                  onTap: () {},
                ),
                const SizedBox(height: 10),

                /// Doctor Speciality
                IconGridView(
                  hightofGridView: Nsize.screenheight * 0.08,
                  crossAxisCount: 4,
                  itemCount: 8,
                  iconimg: Nlist.docTypeIcon,
                  iconName: Nlist.docTypeName,
                  fontsize: 14,
                  radius: 30,
                  circlesize: Nsize.screenheight * 0.027,
                  imgheight: Nsize.screenheight * 0.018,
                  imgwidth: Nsize.screenheight * 0.018,
                ),
                const SizedBox(height: 15),

                /// Top Doctor Heading
                Heading(
                  heading: Ntext.topDoc,
                  wantseebtn: true,
                  headingFontSize: 22,
                  seeall: Ntext.seeall,
                  seeallFontSize: 16,
                ),
                const SizedBox(height: 10),

                /// Doctor 1 Details
                DoctorCard(
                  cardHeight: Nsize.screenheight * 0.05,
                  cardWidth: double.infinity,
                  elevation: 8,
                  borderradius: 18,
                  imagePath: Nimages.docProfile,
                  imageWidth: 120,
                  imageHeight: 120,
                  doctorName: Ntext.docName,
                  doctorType: Ntext.docCatagery,
                  docnamefontSize: 20,
                  docntypefontSize: 14,
                  ratting: '4.1',
                  stariconSize: 20,
                  cityName: 'Ahemdabad',
                ),
                const SizedBox(height: 10),

                /// Doctor 2 Details
                DoctorCard(
                  cardHeight: Nsize.screenheight * 0.05,
                  cardWidth: double.infinity,
                  elevation: 8,
                  borderradius: 18,
                  imagePath: Nimages.docProfile,
                  imageWidth: 120,
                  imageHeight: 120,
                  doctorName: Ntext.docName,
                  doctorType: Ntext.docCatagery,
                  docnamefontSize: 20,
                  docntypefontSize: 14,
                  ratting: '4.1',
                  stariconSize: 20,
                  cityName: 'Ahemdabad',
                ),

                const SizedBox(height: 18),

                /// Our Service Heading
                Heading(
                  heading: Ntext.ourServices,
                  wantseebtn: false,
                  headingFontSize: 22,
                ),
                const SizedBox(height: 10),

                /// Our Services
                IconGridView(
                  hightofGridView: Nsize.screenheight * 0.045,
                  crossAxisCount: 4,
                  itemCount: 4,
                  iconimg: Nlist.servicesIcon,
                  iconName: Nlist.servicesName,
                  fontsize: 14,
                  radius: 30,
                  circlesize: Nsize.screenheight * 0.027,
                  imgheight: Nsize.screenheight * 0.018,
                  imgwidth: Nsize.screenheight * 0.018,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
