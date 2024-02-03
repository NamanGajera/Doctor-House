import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/list.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:dr_house/utils/const/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/appbar/appbar.dart';
import '../../../controller/homeScreenController/homeScreen/homescreenController.dart';
import 'widget/doc_categories_list.dart';

class TopDoctor extends StatefulWidget {
  const TopDoctor({super.key});

  @override
  State<TopDoctor> createState() => _TopDoctorState();
}

class _TopDoctorState extends State<TopDoctor> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar(Ntext.topDoc),
        body: SizedBox(
          height: Nsize.screenheight - MediaQuery.of(context).padding.top,
          width: Nsize.screenwidth,
          child: Column(
            children: [
              const SizedBox(height: 10),

              ///Doctor Catagories List
              SizedBox(
                height: Nsize.screenheight * 0.04,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: Nlist.doctorCategories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.currentCategoriesIndex.value = index;
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: Nsize.screenheight * 0.04,
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, right: 10, left: 10),
                        margin: const EdgeInsets.only(right: 2, left: 8),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(18),
                          color:
                              controller.currentCategoriesIndex.value == index
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
                    );
                  },
                ),
              ),

              /// Doctor List
              const DocCatagoriesList(),
            ],
          ),
        ),
      ),
    );
  }
}
