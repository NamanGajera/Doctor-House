import 'package:flutter/material.dart';
import '../../../../utils/const/colors.dart';

class IconGridView extends StatelessWidget {
  const IconGridView({
    super.key,
    required this.hightofGridView,
    required this.itemCount,
    required this.crossAxisCount,
    required this.iconimg,
    required this.iconName,
    this.fontsize,
    this.radius,
    required this.circlesize,
    this.imgheight,
    this.imgwidth,
  });

  final double hightofGridView;
  final int itemCount;
  final int crossAxisCount;
  // final String iconName;
  final double? radius;
  final double? fontsize;
  final List iconimg;
  final List iconName;
  final double circlesize;
  final double? imgheight;
  final double? imgwidth;

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
              Container(
                alignment: Alignment.center,
                height: circlesize,
                decoration: const BoxDecoration(
                  color: Ncolor.darkblue3,
                  shape: BoxShape.circle,
                ),
                child: Image(
                  image: AssetImage(iconimg[index]),
                  height: imgheight,
                  width: imgwidth,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                iconName[index],
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
