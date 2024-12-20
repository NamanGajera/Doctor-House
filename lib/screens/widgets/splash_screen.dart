import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/core/extension/navigation_extension.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/screens/authScreen/login_screen.dart';
import 'package:doctor_house/screens/onBoardingScreen/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import '../../core/constants/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  checkLogin()async{
    Future.delayed(const Duration(seconds: 2),(){
      context.pushReplacement(const OnBoardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            mainAppLogo,
            height: context.screenHeight * 0.25,
          ).centered(),
        ],
      ),
    );
  }
}
