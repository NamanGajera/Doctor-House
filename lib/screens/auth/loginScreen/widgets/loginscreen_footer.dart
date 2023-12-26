import 'package:dr_house/controller/authsScreenController/LoginController/logincontroller.dart';
import 'package:dr_house/utils/const/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../common/imageType/circleImage.dart';
import '../../../../utils/const/colors.dart';
import '../../../../utils/const/images.dart';
import '../../../../utils/const/size.dart';

class LoginScreenFooter extends StatelessWidget {
  const LoginScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return ElasticIn(
      animate: true,
      delay: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 500),
      child: Column(
        children: [
          /// or connect using text
          Align(
            alignment: Alignment.center,
            child: Text(
              Ntext.footerline,
              style: GoogleFonts.adamina(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Ncolor.lightblacktext,
                ),
              ),
            ),
          ),
          const SizedBox(height: Nsize.spaceBetweenTextField * 1.5),

          /// google and facebook icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleImage(
                height: Nsize.screenheight * 0.02,
                width: Nsize.screenwidth * 0.06,
                imagePath: Nimages.googleicon,
              ),
              CircleImage(
                height: Nsize.screenheight * 0.021,
                width: Nsize.screenwidth * 0.065,
                imagePath: Nimages.facebookicon,
              ),
            ],
          ),
          const SizedBox(height: Nsize.spaceBetweenTextField * 3),

          /// sign up
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Ntext.nothaveacc,
                style: GoogleFonts.adamina(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Ncolor.darkblue1,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.goToSignUpScreen();
                },
                child: Text(
                  Ntext.signup,
                  style: GoogleFonts.adamina(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.blue.shade800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
