import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:doctor_house/core/constants/app_constants.dart';
import 'package:doctor_house/core/constants/colors.dart';
import 'package:doctor_house/core/constants/images.dart';
import 'package:doctor_house/core/constants/shared_preferences_keys.dart';
import 'package:doctor_house/core/constants/widgets.dart';
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

import '../../../core/services/shared_prefs_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// Text Field Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthFailureState) {
            log("Login Error ${state.message}");
          }
          if (state.loginUserModel != null) {
            log("Login Success State ${state.loginUserModel?.toJson()}");
            userName = state.loginUserModel?.user?.name ?? '';
            userEmail = state.loginUserModel?.user?.email ?? '';
            accessToken = state.loginUserModel?.token ?? '';
            isCompleteProfileDone = state.loginUserModel?.user?.isCompleteProfileDone ?? false;

            await SharedPrefsHelper().setString(SharedPreferencesKeys.accessToken, accessToken ?? '');
            await SharedPrefsHelper().setString(SharedPreferencesKeys.userName, userName ?? '');
            await SharedPrefsHelper().setString(SharedPreferencesKeys.userEmail, userEmail ?? '');
            await SharedPrefsHelper().setBool(SharedPreferencesKeys.isCompleterProfileDone, isCompleteProfileDone ?? false);

            if (isCompleteProfileDone == true) {
              context.pushReplacement(homeScreenPath);
            } else {
              context.pushReplacement(completeProfileScreenPath);
            }
          }
        },
        child: mainLoginScreen(),
      ),
    );
  }

  Widget mainLoginScreen() {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                'Welcome Back!',
                style: Theme.of(context).textTheme.headlineMedium,
              ).centered(),
              const SizedBox(height: 10),
              Text(
                'login into your existent account',
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
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return CustomTextField(
                            controller: passwordController,
                            hintText: 'Enter Password',
                            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            cursorColor: primaryDarkBlueColor,
                            prefixIcon: Icons.email,
                            maxLines: 1,
                            borderColor: primaryDarkBlueColor,
                            disabledBorderColor: primaryDarkBlueColor,
                            enabledBorderColor: primaryDarkBlueColor,
                            focusedBorderColor: primaryDarkBlueColor,
                            obscureText: state.showPassword,
                            suffixIcon: state.showPassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                            onTapSuffixIcon: () {
                              context.read<AuthBloc>().add(TogglePasswordVisibilityEvent());
                            },
                            prefixIconColor: Colors.grey,
                            contentPadding: EdgeInsets.zero,
                            borderWidth: 1.5,
                            validator: (value) {
                              if (value!.isNullOrEmpty) {
                                return 'Enter Password';
                              }
                              return null;
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return CustomButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                log('Login Data====>>  ${{
                                  'email': emailController.text.trim(),
                                  'password': passwordController.text.trim(),
                                }}');

                                context.read<AuthBloc>().add(LoginUserEvent(
                                    loginUserData: {"email": emailController.text.trim(), "password": passwordController.text.trim()}));
                              }
                            },
                            isLoading: state.showLoader,
                            label: 'Login',
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                            color: primaryBlueColor,
                            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                          );
                        },
                      ).centered(),
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
              const SizedBox(height: 190),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 10),
                height: 30,
                child: RichText(
                  text: TextSpan(text: 'Don\'t have an account?', style: Theme.of(context).textTheme.titleLarge, children: [
                    TextSpan(
                        text: ' Register',
                        style: const TextStyle(color: primaryDarkBlueColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.replace(registerScreenPath);
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
