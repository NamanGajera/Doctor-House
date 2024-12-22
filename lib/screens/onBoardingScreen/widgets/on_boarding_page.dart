import 'dart:developer';

import 'package:doctor_house/core/constants/colors.dart';
import 'package:doctor_house/core/extension/navigation_extension.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:doctor_house/routers/router.dart';
import 'package:doctor_house/screens/authScreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/widgets.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
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
          ).withPadding(EdgeInsets.symmetric(horizontal: 10)),
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
              CustomButton(
                onPressed: (){
                  log('Tappp');
                  context.replace(loginScreenPath);
                },
                label: 'Let\'s Start',
                color: primaryDarkBlueColor,
                textColor: Colors.white,
                fontSize: 16,
                padding: EdgeInsets.symmetric(horizontal: 100,vertical: 12),
              ),
            ],
          )
              : const SizedBox()
        ],
      ),
    );
  }
}
