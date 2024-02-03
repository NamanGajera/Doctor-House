// ignore_for_file: must_be_immutable
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
    required this.applybold,
    this.borderRadius,
    required this.onTap,
    required this.loading,
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
  bool applybold = true;
  double? borderRadius;
  Function() onTap;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        child: loading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                buttonText,
                style: GoogleFonts.akatab(
                  color: buttonTextColor,
                  fontSize: fontSize,
                  fontWeight: applybold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
      ),
    );
  }
}
