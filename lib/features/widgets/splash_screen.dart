import 'dart:developer';

import 'package:doctor_house/core/constants/app_constants.dart';
import 'package:doctor_house/core/constants/shared_preferences_keys.dart';
import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/core/services/shared_prefs_helper.dart';
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

    accessToken = SharedPrefsHelper().getString(SharedPreferencesKeys.accessTokenKey);
    bool? isOnboarding = prefs.getBool(SharedPreferencesKeys.onBoardingDone);

    await Future.delayed(const Duration(seconds: 2));
    // GoRouter.of(context).pushReplacement(homeScreenPath);
    navigateUser(accessToken != null, isOnboarding);
  }

  Future<void> navigateUser(bool? isLogin, bool? isOnboarding) async {
    if (!mounted) return;
    if (isOnboarding != true) {
      log('Onboarding');
      GoRouter.of(context).pushReplacement(onBoardingScreenPath);
    } else if (isLogin == true) {
      userEmail = SharedPrefsHelper().getString(SharedPreferencesKeys.userEmailKey);
      userName = SharedPrefsHelper().getString(SharedPreferencesKeys.userNameKey);
      hasAcceptedConsent = SharedPrefsHelper().getBool(SharedPreferencesKeys.hasCompleteConsent);

      if (hasAcceptedConsent == true) {
        GoRouter.of(context).pushReplacement(homeScreenPath);
      } else {
        GoRouter.of(context).pushReplacement(completeProfileScreenPath);
      }
    } else {
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
