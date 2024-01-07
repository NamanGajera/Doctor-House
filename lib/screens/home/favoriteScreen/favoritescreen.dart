import 'package:dr_house/controller/homeScreenController/homeScreen/homescreenController.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/appbar/appbar.dart';
import '../../../utils/const/images.dart';
import '../../../utils/const/list.dart';
import '../../../utils/const/size.dart';
import '../homeScreen/widgets/doctor_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar('Favorites'),
        body: Padding(
          padding: const EdgeInsets.only(top: 8, right: 12, left: 12),
          child: SizedBox(
            height: Nsize.screenheight - MediaQuery.of(context).padding.top,
            width: double.infinity,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 3,
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
                    controller.openDoctorDetails();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
