// ignore_for_file: file_names

import 'package:dr_house/screens/home/appointmentScreen/appointmentscreen.dart';
import 'package:dr_house/screens/home/favoriteScreen/favoritescreen.dart';
import 'package:dr_house/screens/home/homeScreen/homescreen.dart';
import 'package:dr_house/screens/home/profileScreen/profilescreen.dart';
import 'package:get/get.dart';

import '../../screens/home/alertScreen/alertscreen.dart';

class MainHomeController extends GetxController {
  List pages = [
    const HomeScreen(),
    const AppointmentScreen(),
    const AlertScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  RxInt navIndex = 0.obs;

  void changeIndex(index) {
    navIndex.value = index;
  }
}
