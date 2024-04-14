// ignore_for_file: file_names

import 'package:dr_house/common/buttons/simplebutton.dart';
import 'package:dr_house/controller/authsScreenController/onBordingController/onBordingController.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:dr_house/utils/const/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBordingPage extends StatelessWidget {
  const OnBordingPage({
    super.key,
    this.backgroundColor,
    required this.image,
    required this.height,
    required this.width,
    this.textColor,
    required this.headline,
    required this.subHedline,
    required this.pageText,
    required this.islastpage,
  });

  final Color? backgroundColor;
  final String image;
  final double height;
  final double width;
  final Color? textColor;
  final String headline;
  final String subHedline;
  final String pageText;
  final bool islastpage;

  @override
  Widget build(BuildContext context) {
    final obController = Get.put(OnBordingController());
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          const SizedBox(height: 50),

          /// Image Text
          Image(
            image: AssetImage(
              image,
            ),
            height: height,
            width: width,
            alignment: Alignment.center,
          ),

          /// Headline Text
          Text(
            headline,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: GoogleFonts.adamina(
              textStyle: TextStyle(
                fontSize: 24,
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 5),

          /// SubHeadline Text
          Text(
            subHedline,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: GoogleFonts.adamina(
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          const SizedBox(height: 60),

          /// Page Text
          Text(
            pageText,
            textAlign: TextAlign.center,
            style: GoogleFonts.adamina(
              textStyle: TextStyle(
                fontSize: 18,
                color: textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          /// Design for only last page
          islastpage
              ? Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: SimpleButton(
                          height: Nsize.screenheight * 0.06,
                          width: double.infinity,
                          backgroundColor: Ncolor.lighttomato,
                          applyborderRadius: true,
                          borderRadius: 15,
                          applyboxShadow: true,
                          blurRadius: 10,
                          shadowColor: Ncolor.lightCream,
                          spreadRadius: 1,
                          buttonText: Ntext.onbordingScreen3Buttontext,
                          buttonTextColor: Ncolor.darkblue1,
                          fontSize: 20,
                          applybold: true,
                          loading: obController.loading.value,
                          onTap: obController.openSignUpScreen,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
