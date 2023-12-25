import 'package:dr_house/controller/authsScreenController/SignUpController/singupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../utils/const/colors.dart';
import '../../../../utils/const/text.dart';

class SignUpScreenFooter extends StatelessWidget {
  const SignUpScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return ElasticIn(
      animate: true,
      delay: const Duration(milliseconds: 600),
      duration: const Duration(milliseconds: 600),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Ntext.haveanacc,
            style: GoogleFonts.adamina(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Ncolor.darkblue1,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              controller.goToLoginScreen();
            },
            child: Text(
              Ntext.login,
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
    );
  }
}
