// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  CircleImage({
    super.key,
    required this.height,
    required this.imagePath,
    required this.width,
  });

  double height;
  double width;
  String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
