import 'package:dr_house/common/buttons/simplebutton.dart';
import 'package:dr_house/controller/authsScreenController/onBordingController/onBordingController.dart';
import 'package:dr_house/screens/auth/onBordingScreen/widget/welcomtext.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:dr_house/utils/const/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/const/images.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBordingController controller = Get.put(OnBordingController());
    return Scaffold(
      body: Container(
        height: Nsize.screenheight,
        width: Nsize.screenwidth,
        color: Ncolor.darkblue1,
        child: Stack(
          children: [
            /// Onbording Image
            Positioned(
              right: -Nsize.screenwidth * 0.06,
              bottom: Nsize.screenheight * 0,
              child: Image.asset(
                Nimages.onbordingImg,
                height: Nsize.screenheight * 0.33,
                width: Nsize.screenwidth * 0.33,
                fit: BoxFit.cover,
              ),
            ),

            /// Welcome Text
            Positioned(
              top: Nsize.screenheight * 0.03,
              left: Nsize.screenwidth * 0.015,
              child: WelcomText(
                text: 'Welcome',
                fontsize: 54,
                fontweight: FontWeight.bold,
                textColor: Ncolor.lightblue,
              ),
            ),

            /// welcome Text
            Positioned(
              top: Nsize.screenheight * 0.057,
              left: Nsize.screenwidth * 0.1,
              child: WelcomText(
                text: 'To',
                fontsize: 38,
                fontweight: FontWeight.w500,
                textColor: Ncolor.lightblue,
              ),
            ),

            /// Welcome Text
            Positioned(
              top: Nsize.screenheight * 0.072,
              left: Nsize.screenwidth * 0.015,
              child: WelcomText(
                text: 'Dr. House',
                fontsize: 50,
                textColor: Ncolor.lightblue,
                fontweight: FontWeight.bold,
              ),
            ),

            /// Sign Up Button
            Positioned(
              bottom: Nsize.screenheight * 0.03,
              left: Nsize.screenwidth * 0.03,
              child: SimpleButton(
                onTap: () {
                  controller.goTosignUpScreen();
                },
                height: Nsize.screenheight * 0.022,
                width: Nsize.screenwidth * 0.13,
                buttonText: Ntext.signup.toUpperCase(),
                backgroundColor: Ncolor.darkblue2,
                fontSize: 20,
                applybold: true,
                applyborderRadius: true,
                borderRadius: 12,
                applyboxShadow: true,
                blurRadius: 8,
                shadowColor: Ncolor.darkblue3,
                spreadRadius: 2,
              ),
            ),

            /// Login Button
            Positioned(
              bottom: Nsize.screenheight * 0.065,
              left: Nsize.screenwidth * 0.03,
              child: SimpleButton(
                onTap: () {
                  controller.goToLoginScreen();
                },
                height: Nsize.screenheight * 0.022,
                width: Nsize.screenwidth * 0.13,
                buttonText: Ntext.login.toUpperCase(),
                backgroundColor: Ncolor.darkblue2,
                fontSize: 20,
                applybold: true,
                applyborderRadius: true,
                borderRadius: 12,
                applyboxShadow: true,
                blurRadius: 8,
                shadowColor: Ncolor.darkblue3,
                spreadRadius: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
