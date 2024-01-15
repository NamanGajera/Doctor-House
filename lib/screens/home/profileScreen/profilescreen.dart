import 'package:dr_house/controller/homeScreenController/homeScreen/profilrScreenController.dart';
import 'package:dr_house/controller/homeScreenController/mainHome_controller.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:dr_house/utils/helper/function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/appbar/appbar.dart';
import 'widgets/ProfileItems.dart';
import 'widgets/profile_image/profileImage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileScreenController());
    final mainHomeController = Get.put(MainHomeController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar('Profile'),
        body: SizedBox(
          height: Nsize.screenheight,
          width: Nsize.screenwidth,
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// Profile Image
              const ProfileImage(),
              const SizedBox(height: 10),

              /// Profile Items
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ProfileItems(
                        itemText: 'Your Profile',
                        leadingIcon: Iconsax.user,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          Nhelper.simpleSnackBar(
                              title: 'On Tap', message: 'Your Profile');
                        },
                      ),
                      ProfileItems(
                        itemText: 'Notification',
                        leadingIcon: Iconsax.notification,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          mainHomeController.navIndex.value = 2;
                        },
                      ),
                      ProfileItems(
                        itemText: 'Favourite',
                        leadingIcon: Iconsax.heart,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          mainHomeController.navIndex.value = 3;
                        },
                      ),
                      ProfileItems(
                        itemText: 'Payment',
                        leadingIcon: Iconsax.card,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          Nhelper.simpleSnackBar(
                              title: 'On Tap', message: 'Payment');
                        },
                      ),
                      ProfileItems(
                        itemText: 'Security',
                        leadingIcon: Iconsax.security,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          Nhelper.simpleSnackBar(
                              title: 'On Tap', message: 'Security');
                        },
                      ),
                      ProfileItems(
                        itemText: 'Help Center',
                        leadingIcon: Iconsax.info_circle,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          Nhelper.simpleSnackBar(
                              title: 'On Tap', message: 'Help Center');
                        },
                      ),
                      ProfileItems(
                        itemText: 'Setting',
                        leadingIcon: Iconsax.setting,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          Nhelper.simpleSnackBar(
                              title: 'On Tap', message: 'Setting');
                        },
                      ),
                      ProfileItems(
                        itemText: 'Privacy Policy',
                        leadingIcon: Iconsax.lock,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          Nhelper.simpleSnackBar(
                              title: 'On Tap', message: 'Privacy Policy');
                        },
                      ),
                      ProfileItems(
                        itemText: 'Log Out',
                        leadingIcon: Iconsax.logout,
                        onTap: () {
                          // Nhelper.simpleSnackBar(
                          //     title: 'On Tap', message: 'Log Out');
                          controller.logout(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
