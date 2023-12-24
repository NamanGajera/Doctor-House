// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/buttons/simplebutton.dart';
import '../../../../common/textfield/textfield.dart';
import '../../../../utils/const/colors.dart';
import '../../../../utils/const/size.dart';
import '../../../../utils/const/text.dart';

class SignUpScreenBody extends StatelessWidget {
  SignUpScreenBody({
    super.key,
    required this.usernamecontroller,
    required this.emailcontroller,
    required this.phonecontroller,
    required this.passwordcontroller,
    required this.confpasswordcontroller,
  });

  TextEditingController usernamecontroller;
  TextEditingController emailcontroller;
  TextEditingController phonecontroller;
  TextEditingController passwordcontroller;
  TextEditingController confpasswordcontroller;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// username
          NtextField(
            bordercolor: Ncolor.darkblue1,
            controller: usernamecontroller,
            labelText: Ntext.username,
            icon: Iconsax.user_octagon,
          ),
          const SizedBox(height: Nsize.spaceBetweenTextField),

          /// email
          NtextField(
            bordercolor: Ncolor.darkblue1,
            controller: passwordcontroller,
            labelText: Ntext.email,
            icon: Icons.email_outlined,
          ),

          const SizedBox(height: Nsize.spaceBetweenTextField),

          /// phone
          NtextField(
            bordercolor: Ncolor.darkblue1,
            controller: usernamecontroller,
            labelText: Ntext.phone,
            icon: Iconsax.call,
            keybordtype: TextInputType.phone,
          ),
          const SizedBox(height: Nsize.spaceBetweenTextField),

          /// password
          NtextField(
            bordercolor: Ncolor.darkblue1,
            controller: usernamecontroller,
            labelText: Ntext.password,
            icon: Iconsax.lock_1,
          ),
          const SizedBox(height: Nsize.spaceBetweenTextField),

          /// phone
          NtextField(
            bordercolor: Ncolor.darkblue1,
            controller: usernamecontroller,
            labelText: Ntext.confpassword,
            icon: Iconsax.lock_1,
          ),
          const SizedBox(height: Nsize.spaceBetweenTextField * 3),

          /// Sign Up button
          SimpleButton(
            height: Nsize.screenheight * 0.022,
            width: Nsize.screenwidth,
            applyborderRadius: true,
            borderRadius: 15,
            applyboxShadow: false,
            buttonText: Ntext.signup.toUpperCase(),
            applybold: true,
            backgroundColor: Ncolor.darkblue2,
            fontSize: 26,
            buttonTextColor: Colors.black,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
