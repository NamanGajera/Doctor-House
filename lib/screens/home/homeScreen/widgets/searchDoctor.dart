import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/const/colors.dart';
import '../../../../utils/const/size.dart';
import '../../../otherScreen/SearchBarScreen/searchBar_screen.dart';

class SearchDoctor extends StatelessWidget {
  const SearchDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const SearchBarScreen());
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: Nsize.screenheight * 0.055,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Ncolor.darkblue1),
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Row(
          children: [
            Icon(Iconsax.search_favorite_1),
            SizedBox(width: 10),
            Text(
              'Search Doctor',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
