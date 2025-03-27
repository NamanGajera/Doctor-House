import 'package:doctor_house/core/constants/app_constants.dart';
import 'package:doctor_house/core/constants/shared_preferences_keys.dart';
import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/core/services/shared_prefs_helper.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    accessToken = SharedPrefsHelper().getString(SharedPreferencesKeys.accessToken);
    bool? isOnboarding = SharedPrefsHelper().getBool(SharedPreferencesKeys.onBoardingDone);

    await Future.delayed(const Duration(seconds: 2));
    navigateUser(accessToken != null, isOnboarding);
  }

  Future<void> navigateUser(bool? isLogin, bool? isOnboarding) async {
    if (!mounted) return;
    if (isOnboarding != true) {
      context.pushReplacement(onBoardingScreenPath);
    } else if (isLogin == true) {
      userEmail = SharedPrefsHelper().getString(SharedPreferencesKeys.userEmail);
      userName = SharedPrefsHelper().getString(SharedPreferencesKeys.userName);
      isProfileCompleted = SharedPrefsHelper().getBool(SharedPreferencesKeys.isCompleterProfileDone);

      if (isProfileCompleted == true) {
        context.pushReplacement(homeScreenPath);
      } else {
        context.pushReplacement(completeProfileScreenPath);
      }
    } else {
      context.pushReplacement(loginScreenPath);
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
