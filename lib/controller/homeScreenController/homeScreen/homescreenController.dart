// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxBool addfavorite = false.obs;
  final searchController = TextEditingController();
  bool seeallselected = true;

  void addToFavorite() {
    addfavorite.value = !addfavorite.value;
  }

  @override
  void onInit() {
    seeallselected = false;
    super.onInit();
  }
}
