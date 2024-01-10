import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import '../../../common/appbar/appbar.dart';
import 'widgets/ProfileItems.dart';
import 'widgets/profile_image/profileImage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar('Profile'),
        body: SizedBox(
          height: Nsize.screenheight,
          width: Nsize.screenwidth,
          child: const Column(
            children: [
              SizedBox(height: 20),

              /// Profile Image
              ProfileImage(),
              SizedBox(height: 10),

              /// Profile Items
              ProfileItems(),
            ],
          ),
        ),
      ),
    );
  }
}
