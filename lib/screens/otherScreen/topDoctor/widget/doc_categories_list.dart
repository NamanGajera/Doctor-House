import 'package:dr_house/controller/homeScreenController/homeScreen/homescreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/const/colors.dart';
import '../../../../utils/const/list.dart';
import '../../../../utils/const/size.dart';

class DocCatagoriesList extends StatelessWidget {
  const DocCatagoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return SizedBox(
      height: Nsize.screenheight * 0.018,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: Nlist.doctorCategories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => controller.currentCategoriesIndex.value = index,
            child: Obx(
              () => Container(
                alignment: Alignment.center,
                height: Nsize.screenheight * 0.018,
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, right: 10, left: 10),
                margin: const EdgeInsets.only(right: 2, left: 8),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(18),
                  color: controller.currentCategoriesIndex.value == index
                      ? Ncolor.darkblue3
                      : Ncolor.lightCream,
                ),
                child: Text(
                  Nlist.doctorCategories[index],
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
