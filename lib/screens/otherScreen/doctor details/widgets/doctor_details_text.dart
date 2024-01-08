import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DoctorDetailsText extends StatelessWidget {
  const DoctorDetailsText({
    super.key,
    required this.docdescription,
  });

  final String docdescription;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      docdescription,
      colorClickableText: Colors.blue,
      textAlign: TextAlign.justify,
      trimMode: TrimMode.Line,
      moreStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      lessStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
