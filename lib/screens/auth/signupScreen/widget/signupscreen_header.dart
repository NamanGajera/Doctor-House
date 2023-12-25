import 'package:dr_house/utils/const/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../utils/const/colors.dart';

class SignUpScreenHeader extends StatelessWidget {
  const SignUpScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      animate: true,
      delay: const Duration(milliseconds: 600),
      duration: const Duration(milliseconds: 600),
      child: Column(
        children: [
          /// welcome text
          Text(
            Ntext.signupHeadline,
            style: GoogleFonts.adamina(
              textStyle: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// welcom text
          Text(
            Ntext.signupSubHeadline,
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
