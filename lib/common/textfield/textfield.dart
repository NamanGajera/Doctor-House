// ignore_for_file: must_be_immutable

import 'package:dr_house/utils/helper/function.dart';
import 'package:flutter/material.dart';
import '../../utils/const/size.dart';

class NtextField extends StatelessWidget {
  NtextField({
    super.key,
    required this.controller,
    required this.bordercolor,
    this.icon,
    required this.labelText,
    this.keybordtype,
    this.validator,
    this.onChanged,
  });

  TextEditingController controller;
  Color? bordercolor;
  String labelText;
  IconData? icon;
  TextInputType? keybordtype;
  String? Function(String?)? validator;
  final void Function(String)? onChanged;
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
      ),
      keyboardType: keybordtype,
      onTapOutside: Nhelper.hideKeybord,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
