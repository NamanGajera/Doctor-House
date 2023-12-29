import 'package:dr_house/screens/home/homeScreen/widgets/doctor_card.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:dr_house/utils/const/text.dart';
import 'package:flutter/material.dart';
import '../../../common/appbar/appbar.dart';
import '../../../utils/const/images.dart';
import 'widget/doc_categories_list.dart';

class TopDoctor extends StatelessWidget {
  const TopDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar(Ntext.topDoc),
        body: SizedBox(
          height: Nsize.screenheight - MediaQuery.of(context).padding.top,
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
                    itemCount: 10,
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
            ],
          ),
        ),
      ),
    );
  }
}
