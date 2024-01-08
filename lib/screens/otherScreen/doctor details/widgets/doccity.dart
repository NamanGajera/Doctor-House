import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/const/colors.dart';

class DocCity extends StatelessWidget {
  const DocCity({
    super.key,
    required this.doccity,
  });
  final String doccity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Iconsax.location,
          size: 20,
        ),
        Text(
          doccity,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            color: Ncolor.lightblacktext,
          ),
        ),
      ],
    );
  }
}
