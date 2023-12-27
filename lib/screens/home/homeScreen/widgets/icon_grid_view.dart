import 'package:flutter/material.dart';
import '../../../../utils/const/colors.dart';

class IconGridView extends StatelessWidget {
  const IconGridView({
    super.key,
    required this.hightofGridView,
    required this.itemCount,
    required this.crossAxisCount,
    required this.iconImage,
    required this.iconName,
    this.fontsize,
    this.radius,
  });

  final double hightofGridView;
  final int itemCount;
  final int crossAxisCount;
  final String iconImage;
  final String iconName;
  final double? radius;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hightofGridView,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CircleAvatar(
                backgroundColor: Ncolor.darkblue3,
                backgroundImage: AssetImage(
                  iconImage,
                ),
                radius: radius,
              ),
              const SizedBox(height: 5),
              Text(
                iconName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontsize,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
