import 'package:flutter/material.dart';

import '../../../../utils/const/images.dart';
import '../../../../utils/const/size.dart';

class DoctorImage extends StatelessWidget {
  const DoctorImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image(
        image: const AssetImage(Nimages.docProfile),
        height: Nsize.screenheight * 0.11,
        width: Nsize.screenheight * 0.07,
        fit: BoxFit.cover,
      ),
    );
  }
}
