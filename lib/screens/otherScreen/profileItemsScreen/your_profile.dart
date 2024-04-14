import 'package:dr_house/screens/otherScreen/profileItemsScreen/widget/profileContainer.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class YourProfileScreen extends StatelessWidget {
  const YourProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Ncolor.lightblue,
      appBar: AppBar(
        backgroundColor: Ncolor.lightblue,
        elevation: 0,
        title: const Text('My Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Ncolor.lightblue,
                image: DecorationImage(
                  image: AssetImage(
                    Nimages.onbordingImg,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Ncolor.lightCream,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  ProfileContainer(title: 'Gajera Naman'),
                  const SizedBox(height: 15),
                  ProfileContainer(title: 'Male'),
                  const SizedBox(height: 15),
                  ProfileContainer(title: '23/3/2004'),
                  const SizedBox(height: 15),
                  ProfileContainer(title: 'namangaj123@gmail.com'),
                  const SizedBox(height: 15),
                  ProfileContainer(title: '9714930012'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
