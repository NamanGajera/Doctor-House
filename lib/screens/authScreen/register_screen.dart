import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:doctor_house/bloc/authScreenBloc/registerScreenBloc/register_screen_bloc.dart';
import 'package:doctor_house/bloc/authScreenBloc/registerScreenBloc/register_screen_event.dart';
import 'package:doctor_house/bloc/authScreenBloc/registerScreenBloc/register_screen_state.dart';
import 'package:doctor_house/core/extension/navigation_extension.dart';
import 'package:doctor_house/core/extension/string_extension.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/screens/authScreen/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toastification/toastification.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/images.dart';
import '../../core/constants/widgets.dart';

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
      body: BlocConsumer<RegisterScreenBloc, RegisterScreenState>(
          builder: (context, state) {
            return mainRegisterScreen(state);
          },
          listener: (context, state) {
            if(state is RegisterFailureState){
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
              // log('Register Error=====>>>  ${state.firebaseFailure.message}');
            }
            if(state is RegisterUserEventState){
              log('User Register Success ===>>> ${state.user.createdAt}');
              log('User Register Success ===>>> ${state.user.id}');
            }
          }),
    );
  }

  Widget mainRegisterScreen(RegisterScreenState state) {
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
                'Let\'s Get Started!',
                style: Theme.of(context).textTheme.headlineMedium,
              ).centered(),
              SizedBox(height: 10),
              Text(
                'create an account to get all features',
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
                        'Username',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
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
          
                      SizedBox(height: 25),
          
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
          
                      SizedBox(height: 25),
          
                      /// Password
                      Text(
                        'Confirm Password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
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
          
                      SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            log('Register User Data ==>> ${
                                {
                                  'email':emailController.text.toString(),
                                  'userName':userNameController.text.toString(),
                                  'password':passwordController.text.toString(),
                                }
                            }');
                            setState(() {

                            });
                            context.read<RegisterScreenBloc>().add(RegisterUserEvent(
                              emailController.text.toString().trim(),
                              userNameController.text..toString().trim(),
                              passwordController.text.toString().trim(),
                            ));
                          }
                        },
                        label: 'Register',
                        isLoading: state is RegisterLoadingState,
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
              SizedBox(height: 50),
               Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 10),
                height: 30,
                child: RichText(
                  text: TextSpan(text: 'Already have an account?', style: Theme.of(context).textTheme.titleLarge, children: [
                    TextSpan(
                        text: ' Login',
                        style: TextStyle(color: primaryDarkBlueColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushReplacement(LoginScreen());
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
