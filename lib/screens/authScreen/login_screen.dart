import 'dart:developer';
import 'package:doctor_house/screens/authScreen/bloc/loginScreenBloc/login_screen_bloc.dart';
import 'package:doctor_house/core/constants/app_constants.dart';
import 'package:doctor_house/core/constants/colors.dart';
import 'package:doctor_house/core/constants/images.dart';
import 'package:doctor_house/core/constants/shared_preferences_keys.dart';
import 'package:doctor_house/core/constants/widgets.dart';
import 'package:doctor_house/core/extension/string_extension.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

import 'bloc/loginScreenBloc/login_screen_event.dart';
import 'bloc/loginScreenBloc/login_screen_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// Text Field Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// Variables
  bool showPassword = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginScreenBloc, LoginScreenState>(
          builder: (context, state) {
            return mainLoginScreen(state);
          },
          listener: (context, state) async {
            if(state is FailureState){
              CustomToast.show(
                context: context,
                title: Text(state.firebaseFailure.message,style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),),
                alignment: Alignment.bottomCenter,
                callbacks: ToastificationCallbacks(
                    onTap: (val){
                      log('On Toast Tap ${val}');
                    }
                ),
                showProgressBar: false,
                dragToClose: true,
                style: ToastificationStyle.fillColored,
                primaryColor: Colors.black,
                foregroundColor: Colors.black,
                icon: Icon(Icons.error_outline,color: Colors.white,),
                backgroundColor: Colors.black,
              );
            }
            if(state is LoginUserEventState){
              log('Login Done===>>> ${state.userModel.email}');
              SharedPreferences prefs = await SharedPreferences.getInstance();

              prefs.setString(spUserEmail, state.userModel.email ?? '');
              prefs.setString(spUserId, state.userModel.id);
              prefs.setString(spUserName, state.userModel.fullName??'');
              prefs.setString(spUserRole, state.userModel.role??'3');
              prefs.setBool(spLoginKey, true);
              prefs.setBool(spOnBoardingKey, true);
              profileDone = prefs.getBool(spProfileDataAdd);

              userEmail = state.userModel.email;
              userId = state.userModel.id;
              userRole = state.userModel.role;
              userName = state.userModel.fullName;

              log('UserId >>>  $userId');
              if(profileDone == true){
                context.replace(homeScreenPath);
              }else{
                context.replace(completeProfileScreenPath);
              }


            }
          }),
    );
  }

  Widget mainLoginScreen(LoginScreenState state) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Welcome Back!',
                style: Theme.of(context).textTheme.headlineMedium,
              ).centered(),
              SizedBox(height: 10),
              Text(
                'login into your existent account',
                style: Theme.of(context).textTheme.titleLarge,
              ).centered(),
              SizedBox(
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
                      SizedBox(
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

                      SizedBox(height: 25),

                      /// Password
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      BlocBuilder<LoginScreenBloc, LoginScreenState>(
                        builder: (context, state) {
                          final showPassword = state is TogglePasswordVisibilityEventState ? state.showPassword : false;
                          return CustomTextField(
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
                            obscureText: showPassword,
                            suffixIcon: showPassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                            onTapSuffixIcon: () {
                              context.read<LoginScreenBloc>().add(TogglePasswordVisibilityEvent());
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

                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CustomButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            log('Login Data====>>  ${
                            {
                              'email':emailController.text.trim(),
                              'password':passwordController.text.trim(),
                            }
                            }');

                            context.read<LoginScreenBloc>().add(LoginUserEvent(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            ));
                          }
                        },
                        isLoading: state is LoginUserLoadingState,
                        label: 'Login',
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        color: primaryBlueColor,
                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                      ).centered(),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          SizedBox(width: 10),
                          Text('Or', style: Theme.of(context).textTheme.bodyMedium),
                          SizedBox(width: 10),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
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
                          SizedBox(
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
              SizedBox(height: 230),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 10),
                height: 30,
                child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: Theme.of(context).textTheme.titleLarge,
                      children: [
                        TextSpan(
                            text: ' Register',
                            style: TextStyle(
                                color: primaryDarkBlueColor
                            ),
                            recognizer: TapGestureRecognizer()..onTap = (){
                              context.replace(registerScreenPath);
                            }
                        )
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
