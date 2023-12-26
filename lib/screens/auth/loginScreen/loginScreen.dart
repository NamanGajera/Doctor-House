// ignore_for_file: file_names

import 'package:dr_house/screens/auth/loginScreen/widgets/loginscreen_footer.dart';
import 'package:dr_house/screens/auth/loginScreen/widgets/loginscreen_header.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/authsScreenController/LoginController/logincontroller.dart';
import 'widgets/loginscreen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header Section :- Images and welcome text
                const LoginScreenHeader(),
                const SizedBox(height: 20),

                /// Body Section :- Form
                LoginScreenBody(
                  usernamecontroller: controller.usernamecontroller,
                  passwordcontroller: controller.passwordcontroller,
                ),
                const SizedBox(height: Nsize.spaceBetweenTextField * 5),

                /// Footer Section :- extra login, sign up
                const LoginScreenFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
