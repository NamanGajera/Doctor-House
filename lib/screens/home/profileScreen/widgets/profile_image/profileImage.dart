// ignore_for_file: file_names

import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'widgets/changeUserImage.dart';
import 'widgets/userimage.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// User Image
        const UserImage(),

        /// Change User image Icon
        Positioned(
          bottom: Nsize.screenheight * 0.014,
          right: Nsize.screenwidth * 0.31,
          child: const ChangeUserImage(),
        ),
      ],
    );
  }
}
