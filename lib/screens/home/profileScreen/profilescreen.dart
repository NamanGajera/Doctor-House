import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/images.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List accountInfoList = [
      'Your Profile',
      'Notification',
      'Favourite',
      'Payment',
      'Security',
      'Help Center',
      'Setting',
      'Privacy Policy',
      'Log Out'
    ];

    List accountInfoIconList = [
      Iconsax.user,
      Iconsax.notification,
      Iconsax.heart,
      Iconsax.card,
      Iconsax.security,
      Iconsax.icon,
      Iconsax.setting,
      Iconsax.lock,
      Iconsax.logout,
    ];
    List accountInfoTralingIcon = [
      Iconsax.arrow_right,
      Iconsax.arrow_right,
      Iconsax.arrow_right,
      Iconsax.arrow_right,
      Iconsax.arrow_right,
      Iconsax.arrow_right,
      Iconsax.arrow_right,
      Iconsax.arrow_right,
      null,
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        body: Scaffold(
          body: SizedBox(
              height: Nsize.screenheight,
              width: Nsize.screenwidth,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: Nsize.screenheight * 0.07,
                        decoration: const BoxDecoration(
                          color: Ncolor.darkblue3,
                          shape: BoxShape.circle,
                        ),
                        child: Image(
                          image: AssetImage(Nimages.onbordingImg),
                          height: Nsize.screenheight * 0.065,
                          width: Nsize.screenheight * 0.065,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 120,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(2, 4),
                                  color: Colors.black.withOpacity(
                                    0.3,
                                  ),
                                  blurRadius: 3,
                                ),
                              ]),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Colors.black,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: accountInfoList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  accountInfoIconList[index],
                                  size: 28,
                                ),
                                title: Text(
                                  accountInfoList[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: Icon(
                                  accountInfoTralingIcon[index],
                                  size: 28,
                                ),
                              ),
                              Divider(
                                thickness: 1.1,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
