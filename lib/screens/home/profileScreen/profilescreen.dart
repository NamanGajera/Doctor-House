import 'package:dr_house/controller/homeScreenController/homeScreen/profileScreenController.dart';
import 'package:dr_house/controller/homeScreenController/mainHome_controller.dart';
import 'package:dr_house/screens/otherScreen/profileItemsScreen/ProfilePayment.dart';
import 'package:dr_house/screens/otherScreen/profileItemsScreen/ProfilePrivacyPolicy.dart';
import 'package:dr_house/screens/otherScreen/profileItemsScreen/ProfileSecurity.dart';
import 'package:dr_house/screens/otherScreen/profileItemsScreen/profileHelpCenter.dart';
import 'package:dr_house/screens/otherScreen/profileItemsScreen/profileNotification.dart';
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
                      /// Your Porifile
                      ProfileItems(
                        itemText: 'My Profile',
                        leadingIcon: Iconsax.user,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          controller.openProfileScreen();
                        },
                      ),

                      /// Notification
                      ProfileItems(
                        itemText: 'Notification',
                        leadingIcon: Iconsax.notification,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          Get.to(() => const ProfileNotification());
                        },
                      ),

                      /// Favorites
                      ProfileItems(
                        itemText: 'Favorite',
                        leadingIcon: Iconsax.heart,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          mainHomeController.navIndex.value = 3;
                        },
                      ),

                      /// Payment
                      ProfileItems(
                        itemText: 'Payment',
                        leadingIcon: Iconsax.card,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          Get.to(()=>const ProfilePayment());
                        },
                      ),

                      /// Security
                      ProfileItems(
                        itemText: 'Security',
                        leadingIcon: Iconsax.security,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                         Get.to(()=>const ProfileSecurity());
                        },
                      ),

                      /// Help Center
                      ProfileItems(
                        itemText: 'Help Center',
                        leadingIcon: Iconsax.info_circle,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          Get.to(()=>const ProfileHelpCenter());
                        },
                      ),

                      /// Privacy Policy
                      ProfileItems(
                        itemText: 'Privacy Policy',
                        leadingIcon: Iconsax.lock,
                        tralingIcon: Iconsax.arrow_right,
                        onTap: () {
                          Get.to(()=>const ProfilePrivacyPolicy());
                          },
                      ),

                      /// Logout
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
