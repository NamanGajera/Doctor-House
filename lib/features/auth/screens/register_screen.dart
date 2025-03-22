import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:doctor_house/core/extension/string_extension.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/features/auth/bloc/auth_bloc.dart';
import 'package:doctor_house/features/auth/bloc/auth_event.dart';
import 'package:doctor_house/features/auth/bloc/auth_state.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../../../core/constants/shared_preferences_keys.dart';
import '../../../core/constants/widgets.dart';
import '../../../core/services/shared_prefs_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  /// Text Field Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  ValueNotifier<bool> registerLoading = ValueNotifier(false);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthFailureState) {
            log("Register User Error == >> ${state.message}");
          }
          if (state.registerUserModel != null) {
            log("Login Success State ${state.loginUserModel?.toJson()}");
            userName = state.loginUserModel?.user?.name ?? '';
            userEmail = state.loginUserModel?.user?.email ?? '';
            accessToken = state.loginUserModel?.token ?? '';
            isCompleteProfileDone = state.loginUserModel?.user?.isCompleteProfileDone ?? false;

            SharedPrefsHelper().setString(SharedPreferencesKeys.userName, userName ?? '');
            SharedPrefsHelper().setString(SharedPreferencesKeys.accessToken, accessToken ?? '');
            SharedPrefsHelper().setString(SharedPreferencesKeys.userEmail, userEmail ?? '');
            SharedPrefsHelper().setBool(SharedPreferencesKeys.isCompleterProfileDone, isCompleteProfileDone ?? false);

            if (isCompleteProfileDone == true) {
              context.pushReplacement(homeScreenPath);
            } else {
              context.pushReplacement(completeProfileScreenPath);
            }
          }
        },
        child: mainRegisterScreen(),
      ),
    );
  }

  Widget mainRegisterScreen() {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'Let\'s Get Started!',
                style: Theme.of(context).textTheme.headlineMedium,
              ).centered(),
              const SizedBox(height: 10),
              Text(
                'create an account to get all features',
                style: Theme.of(context).textTheme.titleLarge,
              ).centered(),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: ElasticIn(
                  animate: true,
                  delay: const Duration(milliseconds: 500),
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Email
                      Text(
                        'Username',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: userNameController,
                        hintText: 'Enter Your Name',
                        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                        cursorColor: primaryDarkBlueColor,
                        prefixIcon: FontAwesomeIcons.user,
                        borderColor: primaryDarkBlueColor,
                        disabledBorderColor: primaryDarkBlueColor,
                        enabledBorderColor: primaryDarkBlueColor,
                        focusedBorderColor: primaryDarkBlueColor,
                        prefixIconColor: Colors.grey,
                        contentPadding: EdgeInsets.zero,
                        borderWidth: 1.5,
                        validator: (value) {
                          if (value!.isNullOrEmpty) {
                            return 'Enter user name';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 25),

                      /// Email
                      Text(
                        'Email',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Enter Email',
                        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                        cursorColor: primaryDarkBlueColor,
                        prefixIcon: Icons.email,
                        borderColor: primaryDarkBlueColor,
                        disabledBorderColor: primaryDarkBlueColor,
                        enabledBorderColor: primaryDarkBlueColor,
                        focusedBorderColor: primaryDarkBlueColor,
                        prefixIconColor: Colors.grey,
                        contentPadding: EdgeInsets.zero,
                        borderWidth: 1.5,
                        validator: (value) {
                          if (value!.isNullOrEmpty) {
                            return 'Enter Email';
                          } else if (!value.isValidEmail) {
                            return 'Enter Valid Email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 25),

                      /// Password
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Enter Password',
                        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                        cursorColor: primaryDarkBlueColor,
                        prefixIcon: Icons.email,
                        borderColor: primaryDarkBlueColor,
                        disabledBorderColor: primaryDarkBlueColor,
                        enabledBorderColor: primaryDarkBlueColor,
                        focusedBorderColor: primaryDarkBlueColor,
                        prefixIconColor: Colors.grey,
                        contentPadding: EdgeInsets.zero,
                        borderWidth: 1.5,
                        validator: (value) {
                          if (value!.isNullOrEmpty) {
                            return 'Enter Password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters long.';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 25),

                      /// Password
                      Text(
                        'Confirm Password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Your Password',
                        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                        cursorColor: primaryDarkBlueColor,
                        prefixIcon: Icons.email,
                        borderColor: primaryDarkBlueColor,
                        disabledBorderColor: primaryDarkBlueColor,
                        enabledBorderColor: primaryDarkBlueColor,
                        focusedBorderColor: primaryDarkBlueColor,
                        prefixIconColor: Colors.grey,
                        contentPadding: EdgeInsets.zero,
                        borderWidth: 1.5,
                        validator: (value) {
                          if (value!.isNullOrEmpty) {
                            return 'Enter Passwords';
                          } else if (value.trim() != passwordController.text.trim()) {
                            return 'Passwords do not match.';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 40,
                      ),
                      BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                        return CustomButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(RegisterUserEvent(registerUserData: {
                                  "name": userNameController.text.trim(),
                                  "email": emailController.text.trim(),
                                  "password": passwordController.text.trim(),
                                }));
                          },
                          label: 'Register',
                          isLoading: state.showLoader,
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          color: primaryBlueColor,
                          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                        ).centered();
                      }),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          const SizedBox(width: 10),
                          Text('Or', style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(width: 10),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            googleLogo,
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            facebookLogo,
                            height: 45,
                            width: 45,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ).withPadding(const EdgeInsets.symmetric(horizontal: 20)),
              const SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 10),
                height: 30,
                child: RichText(
                  text: TextSpan(text: 'Already have an account?', style: Theme.of(context).textTheme.titleLarge, children: [
                    TextSpan(
                        text: ' Login',
                        style: const TextStyle(color: primaryDarkBlueColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.replace(loginScreenPath);
                          })
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
