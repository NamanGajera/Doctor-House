// ignore_for_file: file_names

import 'package:dr_house/controller/authsScreenController/SignUpController/singupcontroller.dart';
import 'package:dr_house/screens/auth/signupScreen/widget/signupscreen_footer.dart';
import 'package:dr_house/screens/auth/signupScreen/widget/signupscreen_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/const/colors.dart';
import '../../../utils/const/size.dart';
import 'widget/signupscreen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),

                  ///Header :- Text
                  const SignUpScreenHeader(),
                  const SizedBox(height: 30),

                  /// Body :- Form And Buttons
                  SignUpScreenBody(
                    usernamecontroller: controller.usernamecontroller,
                    emailcontroller: controller.emailcontroller,
                    phonecontroller: controller.phonecontroller,
                    confpasswordcontroller: controller.confpasscontroller,
                    passwordcontroller: controller.passwordcontroller,
                  ),
                  SizedBox(height: Nsize.screenheight * 0.075),

                  /// footer :- Text and Login Button
                  const SignUpScreenFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
