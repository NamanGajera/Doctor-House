import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class UserIntro extends StatelessWidget {
  const UserIntro({super.key, required this.userName, required this.intro});
  final String userName;
  final String intro;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: GoogleFonts.akatab(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              intro,
              style: GoogleFonts.akatab(
                color: Ncolor.lightblacktext,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.notification),
          ),
        ),
      ],
    );
  }
}
