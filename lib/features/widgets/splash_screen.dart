import 'dart:developer';

import 'package:doctor_house/core/constants/app_constants.dart';
import 'package:doctor_house/core/constants/shared_preferences_keys.dart';
import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/routers/route_path.dart';
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
    // GoRouter.of(context).pushReplacement(completeProfileScreenPath);
    navigateUser(isLogin, isOnboarding);
  }

  Future<void> navigateUser(bool? isLogin, bool? isOnboarding) async {
    if (!mounted) return;
    if (isOnboarding != true) {
      log('Onboarding');
      GoRouter.of(context).pushReplacement(onBoardingScreenPath);
    } else if (isLogin == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userEmail = prefs.getString(spUserEmail);
      userId = prefs.getString(spUserId);
      userName = prefs.getString(spUserName);
      userRole = prefs.getString(spUserRole);
      profileDone = prefs.getBool(spProfileDataAdd);
      userFirstName = prefs.getString(spUserFirstName);
      userLastName = prefs.getString(spUserLastName);
      userProfile = prefs.getString(spUserProfile);
      userMobileNumber = prefs.getString(spUserMobileNumber);
      log('Home');

      if (profileDone == true) {
        GoRouter.of(context).pushReplacement(homeScreenPath);
      } else {
        GoRouter.of(context).pushReplacement(completeProfileScreenPath);
      }
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
