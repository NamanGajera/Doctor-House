// ignore_for_file: unrelated_type_equality_checks

import 'package:dr_house/controller/authsScreenController/onBordingController/onBordingController.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBordingController obController = Get.put(OnBordingController());

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// Pages
          Obx(
            () => LiquidSwipe(
              liquidController: obController.liquidController,
              pages: obController.pages,
              slideIconWidget: (obController.dotCurrentIndex != 2)
                  ? const Icon(Iconsax.arrow_left_2, size: 40)
                  : const SizedBox(),
              enableSideReveal: true,
              enableLoop: false,
              positionSlideIcon: 0.85,
              onPageChangeCallback: obController.onPageChangeCallback,
            ),
          ),

          /// Skip Button
          Obx(
            () => obController.dotCurrentIndex.value != 2
                ? Positioned(
                    top: 50,
                    right: 40,
                    child: GestureDetector(
                      onTap: obController.onbordpageSkip,
                      child: Text(
                        'Skip',
                        style: GoogleFonts.adamina(
                          color: Ncolor.darkblue1,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ),

          /// Page Indicator
          Obx(
            () => Positioned(
              bottom: Nsize.screenheight * 0.008,
              child: AnimatedSmoothIndicator(
                activeIndex: obController.dotCurrentIndex.value,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Ncolor.darkblue1,
                  dotHeight: 6.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
