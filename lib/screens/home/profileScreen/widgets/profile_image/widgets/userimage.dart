import 'package:flutter/material.dart';

import '../../../../../../utils/const/colors.dart';
import '../../../../../../utils/const/images.dart';
import '../../../../../../utils/const/size.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Nsize.screenheight * 0.07,
      decoration: const BoxDecoration(
        color: Ncolor.darkblue3,
        shape: BoxShape.circle,
      ),
      child: Image(
        image: const AssetImage(Nimages.onbordingImg),
        height: Nsize.screenheight * 0.065,
        width: Nsize.screenheight * 0.065,
        fit: BoxFit.cover,
      ),
    );
  }
}
