// ignore_for_file: file_names
import 'dart:convert';

import 'package:dr_house/screens/otherScreen/doctor%20details/doctordetails.dart';
import 'package:dr_house/screens/otherScreen/doctorSpeciality/doctorcategories.dart';
import 'package:dr_house/utils/const/list.dart';
import 'package:dr_house/utils/helper/function.dart';
import 'package:dr_house/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxBool addfavorite = false.obs;
  final searchController = TextEditingController();
  RxInt currentCategoriesIndex = 0.obs;
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initfavorites();
  }

  void addToFavorite() {
    addfavorite.value = !addfavorite.value;
  }

  iconOnClick(int index) {
    Get.to(() => DoctorCategories(title: Nlist.docTypeName[index]));
  }

  openDoctorDetails(
    String docname,
    String doctype,
    String doccity,
    String docdegree,
    String docdescription,
    String id,
  ) {
    Get.to(
      () => DoctorDetails(
        docname: docname,
        doctype: doctype,
        doccity: doccity,
        docdegree: docdegree,
        docdescription: docdescription,
        id: id,
      ),
    );
  }

  /// Add to Favourites
  void initfavorites() {
    final json = NLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storageFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storageFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorites(String id) {
    return favorites[id] ?? false;
  }

  void toggelFavorites(String id) {
    if (!favorites.containsKey(id)) {
      favorites[id] = true;
      saveFavoritesToStorage();
      Nhelper.shortSnackBar(
          title: 'Successfully', message: 'Added to Favorites');
    } else {
      NLocalStorage.instance().removeData(id);
      favorites.remove(id);
      saveFavoritesToStorage();
      Nhelper.shortSnackBar(title: 'Remove', message: 'From Favorites');
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    NLocalStorage.instance().saveData('favorites', encodedFavorites);
  }
}
