// ignore_for_file: must_be_immutable

import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  Heading({
    super.key,
    required this.heading,
    required this.wantseebtn,
    required this.headingFontSize,
    this.seeall,
    this.seeallFontSize,
    this.onTap,
  });

  final String heading;
  bool wantseebtn = true;
  final String? seeall;
  final double headingFontSize;
  final double? seeallFontSize;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Heading Text
        Text(
          heading,
          style: TextStyle(
            fontSize: headingFontSize,
            color: Ncolor.darkblue1,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),

        /// See All Button
        wantseebtn
            ? GestureDetector(
                onTap: onTap,
                child: Text(
                  seeall!,
                  style: TextStyle(
                    fontSize: seeallFontSize,
                    color: Ncolor.darkblue2,
                  ),
                ),
              )
            : const SizedBox(),
        const SizedBox(width: 8),
      ],
    );
  }
}
