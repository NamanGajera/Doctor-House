// ignore_for_file: file_names
import 'package:dr_house/screens/otherScreen/doctor%20details/doctordetails.dart';
import 'package:dr_house/screens/otherScreen/doctorSpeciality/doctorcategories.dart';
import 'package:dr_house/utils/const/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxBool addfavorite = false.obs;
  final searchController = TextEditingController();
  RxInt currentCategoriesIndex = 0.obs;
  int clickedindex = 0;

  void addToFavorite() {
    addfavorite.value = !addfavorite.value;
  }

  iconOnClick(int index) {
    Get.to(() => DoctorCategories(title: Nlist.docTypeName[index]));
  }

  openDoctorDetails(String docname, String doctype, String doccity,
      String docdegree, String docdescription) {
    Get.to(
      () => DoctorDetails(
        docname: docname,
        doctype: doctype,
        doccity: doccity,
        docdegree: docdegree,
        docdescription: docdescription,
      ),
    );
  }
}
