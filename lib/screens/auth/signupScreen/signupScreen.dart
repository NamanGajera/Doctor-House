// ignore_for_file: file_names

import 'package:dr_house/screens/auth/signupScreen/widget/signupscreen_footer.dart';
import 'package:dr_house/screens/auth/signupScreen/widget/signupscreen_header.dart';
import 'package:flutter/material.dart';
import '../../../utils/const/colors.dart';
import '../../../utils/const/size.dart';
import 'widget/signupscreen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const SignUpScreenBody(),
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
