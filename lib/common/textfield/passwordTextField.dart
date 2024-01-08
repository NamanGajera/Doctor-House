// ignore_for_file: file_names

import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/helper/function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/const/size.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.bordercolor,
    this.icon,
    required this.labelText,
    this.keybordtype,
    required this.obscureText,
    required this.onPressed,
    this.validator,
  });

  final TextEditingController controller;
  final Color? bordercolor;
  final String labelText;
  final IconData? icon;
  final TextInputType? keybordtype;
  final bool obscureText;
  final Function() onPressed;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: bordercolor!,
          ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: bordercolor,
          fontSize: Nsize.labletextfont,
        ),
        prefixIcon: Icon(
          icon,
          size: Nsize.prifixicon,
          color: bordercolor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: bordercolor!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: bordercolor!,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: obscureText
              ? const Icon(
                  Iconsax.eye_slash,
                  color: Ncolor.darkblue1,
                )
              : const Icon(
                  Iconsax.eye,
                  color: Ncolor.darkblue1,
                ),
        ),
      ),
      keyboardType: keybordtype,
      obscureText: obscureText,
      onTapOutside: Nhelper.hideKeybord,
      validator: validator,
    );
  }
}
