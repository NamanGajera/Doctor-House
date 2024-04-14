import 'package:dr_house/utils/const/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../utils/const/colors.dart';
import '../../../../utils/const/images.dart';
import '../../../../utils/const/size.dart';

class LoginScreenHeader extends StatelessWidget {
  const LoginScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      animate: true,
      delay: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 500),
      child: Column(
        children: [
          /// Image
          Align(
            alignment: Alignment.center,
            child: Image(
              image: const AssetImage(Nimages.loginscreenImg),
              height: Nsize.screenheight * 0.25,
              width: Nsize.screenwidth ,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),

          /// welcome text
          Text(
            Ntext.headline,
            style: GoogleFonts.adamina(
              textStyle: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// welcom text
          Text(
            Ntext.subheadline,
            style: GoogleFonts.adamina(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Ncolor.lightblacktext,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
