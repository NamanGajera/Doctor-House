import 'package:dr_house/common/appbar/appbar.dart';
import 'package:dr_house/screens/home/homeScreen/widgets/doctor_card.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';
import '../../../utils/const/images.dart';
import '../../../utils/const/list.dart';
import '../../../utils/const/size.dart';
import '../../../utils/const/text.dart';

class DoctorCategories extends StatelessWidget {
  const DoctorCategories({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Nappbar.appbar(title),
        backgroundColor: Ncolor.lightCream,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              /// Search Bar

              const SizedBox(height: 10),

              /// Doctor Details
              Expanded(
                child: ListView.separated(
                  itemCount: Nlist.doclist.length,
                  physics: const BouncingScrollPhysics(),
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
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
