// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomText extends StatelessWidget {
  WelcomText({
    super.key,
    required this.text,
    this.fontsize,
    this.fontweight,
    this.textColor,
  });

  String text;
  double? fontsize;
  Color? textColor;
  FontWeight? fontweight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.kalam(
        textStyle: TextStyle(
          fontSize: fontsize!,
          color: textColor,
          fontWeight: fontweight,
        ),
      ),
    );
  }
}
