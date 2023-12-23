import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/buttons/simplebutton.dart';
import '../../../../common/textfield/textfield.dart';
import '../../../../utils/const/colors.dart';
import '../../../../utils/const/size.dart';
import '../../../../utils/const/text.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({
    super.key,
    required this.usernamecontroller,
    required this.passwordcontroller,
  });

  final TextEditingController usernamecontroller;
  final TextEditingController passwordcontroller;

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

          /// password
          NtextField(
            bordercolor: Ncolor.darkblue1,
            controller: passwordcontroller,
            labelText: Ntext.password,
            icon: Iconsax.lock_1,
          ),

          /// forgot password text
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Ncolor.darkblue1,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: Nsize.spaceBetweenTextField),

          /// login button
          SimpleButton(
            height: Nsize.screenheight * 0.022,
            width: Nsize.screenwidth * 0.2,
            applyborderRadius: true,
            borderRadius: 26,
            applyboxShadow: false,
            buttonText: Ntext.login.toUpperCase(),
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
