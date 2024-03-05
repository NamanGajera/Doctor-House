// ignore_for_file: file_names
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dr_house/screens/otherScreen/doctor%20details/doctordetails.dart';
import 'package:dr_house/screens/otherScreen/doctorSpeciality/doctorcategories.dart';
import 'package:dr_house/utils/const/list.dart';
import 'package:dr_house/utils/helper/function.dart';
import 'package:dr_house/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final searchController = TextEditingController();
  RxInt currentCategoriesIndex = 0.obs;
  final favorites = <String, bool>{}.obs;
  List doclist = [];
  RxList searchlist = [].obs;

  @override
  void onInit() {
    super.onInit();
    initfavorites();
    initSearch();
  }

  /// open doctor categories
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

  /// check doctor is favorit or not
  bool isFavorites(String id) {
    return favorites[id] ?? false;
  }

  /// change the favorite
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

  /// save favorite doc ist to local storage
  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    NLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  /// adding doc data from firebase to list
  void initSearch() async {
    await FirebaseFirestore.instance
        .collection('Doctor')
        .get()
        .then((value) => doclist = value.docs);
    searchlist.value = doclist;
  }

  /// search doctor acording to user
  void searchdoctor(String docname) {
    List result = [];
    if (searchController.text.isEmpty) {
      result = doclist;
    } else {
      result = doclist
          .where((element) => element['name']
              .toString()
              .toLowerCase()
              .contains(docname.toLowerCase()))
          .toList();
    }
    searchlist.value = result;
  }
}
