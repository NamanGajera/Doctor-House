// ignore_for_file: file_names

import 'package:dr_house/screens/auth/loginScreen/widgets/loginscreen_footer.dart';
import 'package:dr_house/screens/auth/loginScreen/widgets/loginscreen_header.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'widgets/loginscreen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header Section :- Images and welcome text
                LoginScreenHeader(),
                SizedBox(height: 20),

                /// Body Section :- Form
                LoginScreenBody(),
                SizedBox(height: Nsize.spaceBetweenTextField * 5),

                /// Footer Section :- extra login, sign up
                LoginScreenFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
