import 'dart:developer';

import 'package:doctor_house/core/constants/shared_preferences_keys.dart';
import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/core/extension/navigation_extension.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:doctor_house/routers/router.dart';
import 'package:doctor_house/screens/authScreen/login_screen.dart';
import 'package:doctor_house/screens/onBoardingScreen/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? isLogin = prefs.getBool(spLoginKey);
    bool? isOnboarding = prefs.getBool(spOnBoardingKey);

    await Future.delayed(const Duration(seconds: 2));
    navigateUser(isLogin, isOnboarding);
  }

  void navigateUser(bool? isLogin, bool? isOnboarding) {
    if (!mounted) return;
    if (isOnboarding != true) {
      log('Onboarding');
      GoRouter.of(context).pushReplacement(onBoardingScreenPath);
    } else if (isLogin == true) {
      log('Home');
      GoRouter.of(context).pushReplacement(completeProfileScreenPath);
    } else {
      log('Login');
      GoRouter.of(context).pushReplacement(loginScreenPath);
    }
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
