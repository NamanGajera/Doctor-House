// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ChangeUserImage extends StatelessWidget {
  const ChangeUserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 4),
              color: Colors.black.withOpacity(
                0.3,
              ),
              blurRadius: 3,
            ),
          ]),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.add_a_photo,
          color: Colors.black,
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
