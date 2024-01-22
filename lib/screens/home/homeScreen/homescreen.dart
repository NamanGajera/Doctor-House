import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dr_house/common/textfield/textfield.dart';
import 'package:dr_house/controller/homeScreenController/homeScreen/homescreenController.dart';
import 'package:dr_house/screens/home/homeScreen/widgets/doctor_card.dart';
import 'package:dr_house/screens/home/homeScreen/widgets/userIntro.dart';
import 'package:dr_house/screens/otherScreen/doctorSpeciality/doctor_speciality.dart';
import 'package:dr_house/screens/otherScreen/topDoctor/topdoctor.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/images.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:dr_house/utils/const/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/const/list.dart';
import 'widgets/heading.dart';
import '../../../common/gridview/doctortypes_icon.dart';
import 'widgets/servicestypes_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
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
                UserIntro(
                  userName: 'Hii ${Ntext.userName}!',
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
                  onTap: () {
                    Get.to(() => const DoctorSpeciality());
                  },
                ),
                const SizedBox(height: 10),

                /// Doctor Speciality
                DoctorTypesIcon(
                  hightofGridView: Nsize.screenheight * 0.08,
                  crossAxisCount: 4,
                  itemCount: 8,
                  iconimg: Nlist.docTypeIcon,
                  iconName: Nlist.docTypeName,
                  fontsize: 14,
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
                  onTap: () {
                    Get.to(() => const TopDoctor());
                  },
                ),
                const SizedBox(height: 10),

                /// Doctor 1 Details
                for (int i = 0; i < 2; i++)
                  DoctorCard(
                    borderradius: 18,
                    cardHeight: Nsize.screenheight * 0.06,
                    imageHeight: Nsize.screenheight * 0.1,
                    imageWidth: Nsize.screenwidth * 0.11,
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
                    onTap: () {
                      controller.openDoctorDetails(
                        Nlist.doclist[i]['name'],
                        Nlist.doclist[i]['type'],
                        Nlist.doclist[i]['city'],
                        Nlist.doclist[i]['degree'],
                        Nlist.doclist[i]['details'],
                      );
                    },
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
                ServicesTypesIcon(
                  hightofGridView: Nsize.screenheight * 0.045,
                  crossAxisCount: 4,
                  itemCount: 4,
                  iconimg: Nlist.servicesIcon,
                  iconName: Nlist.servicesName,
                  fontsize: 14,
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

  void getdata() async {
    User? user = auth.currentUser;
    final uid = user?.uid;

    final DocumentSnapshot userdoc =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();

    setState(() {
      Ntext.userName = userdoc.get('name');
      Ntext.userEmail = userdoc.get('email');
    });
  }
}
