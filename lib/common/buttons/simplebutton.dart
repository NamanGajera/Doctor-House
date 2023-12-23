// ignore_for_file: must_be_immutable

import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleButton extends StatelessWidget {
  SimpleButton({
    super.key,
    required this.height,
    required this.width,
    required this.applyborderRadius,
    this.backgroundColor,
    required this.applyboxShadow,
    this.blurRadius,
    this.shadowColor,
    this.spreadRadius,
    required this.buttonText,
    this.buttonTextColor,
    this.fontSize,
    required this.applyblod,
    this.borderRadius,
    required this.onTap,
  });

  double height;
  double width;
  bool applyborderRadius = true;
  Color? backgroundColor;
  bool applyboxShadow = false;
  double? blurRadius;
  Color? shadowColor;
  double? spreadRadius;
  String buttonText;
  Color? buttonTextColor;
  double? fontSize;
  bool applyblod = true;
  double? borderRadius;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: applyborderRadius
              ? BorderRadius.circular(borderRadius!)
              : BorderRadius.zero,
          color: backgroundColor,
          boxShadow: [
            applyboxShadow
                ? BoxShadow(
                    blurRadius: blurRadius!,
                    color: shadowColor!,
                    spreadRadius: spreadRadius!,
                  )
                : const BoxShadow()
          ],
        ),
        child: Text(
          buttonText,
          style: GoogleFonts.lato(
            color: buttonTextColor,
            fontSize: fontSize,
            fontWeight: applyblod ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
