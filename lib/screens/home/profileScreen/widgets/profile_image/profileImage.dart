// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'widgets/changeUserImage.dart';
import 'widgets/userimage.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        /// User Image
        UserImage(),

        /// Change User image Icon
        Positioned(
          bottom: 15,
          right: 120,
          child: ChangeUserImage(),
        ),
      ],
    );
  }
}
