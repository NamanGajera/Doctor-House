import 'package:dr_house/utils/const/text.dart';
import 'package:flutter/material.dart';

import '../../../common/appbar/appbar.dart';
import '../../../utils/const/images.dart';
import '../../../utils/const/size.dart';
import '../homeScreen/widgets/doctor_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  doctorName: Ntext.docName,
                  doctorType: Ntext.docCatagery,
                  docnamefontSize: 20,
                  docntypefontSize: 14,
                  ratting: '4.1',
                  stariconSize: 20,
                  cityName: 'Ahemdabad',
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
