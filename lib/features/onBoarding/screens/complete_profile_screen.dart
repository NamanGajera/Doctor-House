import 'dart:developer';

import 'package:doctor_house/core/constants/app_constants.dart';
import 'package:doctor_house/core/constants/colors.dart';
import 'package:doctor_house/core/constants/shared_preferences_keys.dart';
import 'package:doctor_house/core/extension/string_extension.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/features/onBoarding/bloc/on_boardin_screen_event.dart';
import 'package:doctor_house/features/onBoarding/bloc/on_boardin_screen_state.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/widgets.dart';
import '../../../core/services/shared_prefs_helper.dart';
import '../../../utils/helper_functions.dart';
import '../bloc/on_boardin_screen_bloc.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state.completeProfileModel != null) {
            log('Complete Profile Data Done===>>>>> ${state.completeProfileModel?.toJson()}');
            userFirstName = state.completeProfileModel?.user?.firstName;
            userLastName = state.completeProfileModel?.user?.lastName;
            userName = state.completeProfileModel?.user?.name;
            userEmail = state.completeProfileModel?.user?.email;
            gender = state.completeProfileModel?.user?.gender;
            age = state.completeProfileModel?.user?.age;
            userProfileImage = state.completeProfileModel?.user?.profileImage;

            SharedPrefsHelper().setString(SharedPreferencesKeys.userName, userName ?? '');
            SharedPrefsHelper().setString(SharedPreferencesKeys.userFirstName, userFirstName ?? '');
            SharedPrefsHelper().setString(SharedPreferencesKeys.userLastName, userLastName ?? '');
            SharedPrefsHelper().setString(SharedPreferencesKeys.userEmail, userEmail ?? '');
            SharedPrefsHelper().setString(SharedPreferencesKeys.userGender, gender ?? '');
            SharedPrefsHelper().setString(SharedPreferencesKeys.userAge, '${age ?? ''}');
            SharedPrefsHelper().setString(SharedPreferencesKeys.userProfileImage, userProfileImage ?? '');

            context.pushReplacement(homeScreenPath);
          }
          if (state is AuthFailureState) {
            log('Complete Profile Error ==>>> ${state.message}');
          }
        },
        child: completeProfileScreen(),
      ),
    );
  }

  Widget completeProfileScreen() {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Complete Your Profile',
              style: Theme.of(context).textTheme.headlineMedium,
            ).centered(),
            const SizedBox(height: 5),
            Text(
              "Don't worry, only you can see your personal data.\nNo one else will be able to see it.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ).centered(),
            const SizedBox(height: 30),
            BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(55),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: state.selectedUserProfileImage != null
                          ? Image.file(
                              state.selectedUserProfileImage!,
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              Icons.person,
                              size: 40,
                            ),
                    ),
                    Positioned(
                      bottom: 3,
                      right: 3,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: primaryYellowColor,
                          borderRadius: BorderRadius.circular(55),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: const Icon(
                          Icons.edit,
                          size: 18,
                        ),
                      ).onTap(() {
                        _showImagePickerBottomSheet();
                      }),
                    ),
                  ],
                );
              },
            ).centered(),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// First Name
                  CustomText.titleMedium(
                    'First Name',
                    fontSize: 15,
                  ).withPadding(const EdgeInsets.symmetric(horizontal: 18)),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    controller: _firstNameController,
                    hintText: 'Enter First Name',
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    cursorColor: primaryDarkBlueColor,
                    prefixIcon: Icons.person,
                    borderColor: primaryDarkBlueColor,
                    disabledBorderColor: primaryDarkBlueColor,
                    enabledBorderColor: primaryDarkBlueColor,
                    focusedBorderColor: primaryDarkBlueColor,
                    prefixIconColor: Colors.grey,
                    contentPadding: EdgeInsets.zero,
                    borderWidth: 1.5,
                    validator: (value) {
                      if (value!.isNullOrEmpty) {
                        return 'Enter First Name';
                      }
                      return null;
                    },
                  ).withPadding(const EdgeInsets.symmetric(horizontal: 18)),
                  const SizedBox(height: 20),

                  /// Last Name
                  CustomText.titleMedium(
                    'Last Name',
                    fontSize: 15,
                  ).withPadding(const EdgeInsets.symmetric(horizontal: 18)),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    controller: _lastNameController,
                    hintText: 'Enter Last Name',
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    cursorColor: primaryDarkBlueColor,
                    prefixIcon: Icons.person,
                    borderColor: primaryDarkBlueColor,
                    disabledBorderColor: primaryDarkBlueColor,
                    enabledBorderColor: primaryDarkBlueColor,
                    focusedBorderColor: primaryDarkBlueColor,
                    prefixIconColor: Colors.grey,
                    contentPadding: EdgeInsets.zero,
                    borderWidth: 1.5,
                    validator: (value) {
                      if (value!.isNullOrEmpty) {
                        return 'Enter Last Name';
                      }
                      return null;
                    },
                  ).withPadding(const EdgeInsets.symmetric(horizontal: 18)),
                  const SizedBox(height: 20),

                  /// Phone Number Name
                  CustomText.titleMedium(
                    'Phone Number',
                    fontSize: 15,
                  ).withPadding(const EdgeInsets.symmetric(horizontal: 18)),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    controller: _phoneController,
                    hintText: 'Enter Phone Number',
                    keyboardType: TextInputType.phone,
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    cursorColor: primaryDarkBlueColor,
                    prefixIcon: Icons.phone,
                    borderColor: primaryDarkBlueColor,
                    disabledBorderColor: primaryDarkBlueColor,
                    enabledBorderColor: primaryDarkBlueColor,
                    focusedBorderColor: primaryDarkBlueColor,
                    prefixIconColor: Colors.grey,
                    contentPadding: EdgeInsets.zero,
                    borderWidth: 1.5,
                    validator: (value) {
                      if (value!.isNullOrEmpty) {
                        return 'Enter First Name';
                      }
                      return null;
                    },
                  ).withPadding(const EdgeInsets.symmetric(horizontal: 18)),
                  const SizedBox(height: 20),

                  ///
                  CustomText.titleMedium(
                    'Age',
                    fontSize: 15,
                  ).withPadding(const EdgeInsets.symmetric(horizontal: 18)),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    controller: _ageController,
                    hintText: 'Enter Age',
                    keyboardType: TextInputType.phone,
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    cursorColor: primaryDarkBlueColor,
                    prefixIcon: Icons.phone,
                    borderColor: primaryDarkBlueColor,
                    disabledBorderColor: primaryDarkBlueColor,
                    enabledBorderColor: primaryDarkBlueColor,
                    focusedBorderColor: primaryDarkBlueColor,
                    prefixIconColor: Colors.grey,
                    contentPadding: EdgeInsets.zero,
                    borderWidth: 1.5,
                    validator: (value) {
                      if (value!.isNullOrEmpty) {
                        return 'Enter Age';
                      }
                      return null;
                    },
                  ).withPadding(const EdgeInsets.symmetric(horizontal: 18)),
                  const SizedBox(height: 20),

                  /// Gender Dropdown
                  CustomText.titleMedium(
                    'Gender',
                    fontSize: 15,
                  ).withPadding(const EdgeInsets.symmetric(horizontal: 18)),
                  const SizedBox(height: 8),
                  BlocBuilder<OnboardingBloc, OnboardingState>(builder: (context, state) {
                    return CustomDropdown<String>(
                      items: ['Male', 'Female', 'Other'],
                      hintText: 'Select Gender',
                      value: state.selectedGender,
                      borderColor: primaryDarkBlueColor,
                      onChanged: (value) {
                        context.read<OnboardingBloc>().add(SelectGenderEvent(value));
                      },
                      enabledBorderColor: primaryDarkBlueColor,
                      focusedBorderColor: primaryDarkBlueColor,
                      disabledBorderColor: primaryDarkBlueColor,
                      itemBuilder: (item) => CustomText(item),
                    ).withPadding(const EdgeInsets.symmetric(horizontal: 18));
                  }),
                ],
              ),
            ),
            const SizedBox(height: 30),
            BlocBuilder<OnboardingBloc, OnboardingState>(builder: (context, state) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Checkbox(
                      value: state.isChecked,
                      onChanged: (val) {
                        context.read<OnboardingBloc>().add(ToggleConformationCheckBoxEvent());
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text('I confirm that I have read and agree to the Terms of Service and Privacy Policy.',
                          style: Theme.of(context).textTheme.labelMedium)
                      .onTap(() {
                    // completeProfileScreenBloc.add(ToggleCheckBoxEvent());
                  }).expand(),
                ],
              ).withPadding(const EdgeInsets.symmetric(horizontal: 18));
            }),
            const SizedBox(height: 50),
            BlocBuilder<OnboardingBloc, OnboardingState>(builder: (context, state) {
              return CustomButton(
                label: 'Continue',
                onPressed: () {
                  if (state.isChecked) {
                    log('Profile Form Data ==>>> ${{
                      "profileImage": state.selectedUserProfileImage,
                      "firstName": _firstNameController.text.trim(),
                      "lastName": _lastNameController.text.trim(),
                      "mobileNumber": _phoneController.text.trim(),
                      "gender": state.selectedGender,
                      "age": _ageController.text.trim(),
                    }}');

                    context.read<OnboardingBloc>().add(CompleteProfileEvent(
                          {
                            "profileImage": state.selectedUserProfileImage,
                            "firstName": _firstNameController.text.trim(),
                            "lastName": _lastNameController.text.trim(),
                            "mobileNumber": _phoneController.text.trim(),
                            "gender": state.selectedGender,
                            "age": _ageController.text.trim(),
                          },
                        ));
                  }
                },
                textColor: state.isChecked ? Colors.white : Colors.black,
                color: state.isChecked ? primaryBlueColor : Colors.grey.shade400,
                borderRadius: 12,
                width: double.infinity,
                isLoading: state.showLoader,
                padding: const EdgeInsets.symmetric(vertical: 11),
              ).centered().withPadding(const EdgeInsets.symmetric(horizontal: 18));
            }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _showImagePickerBottomSheet() async {
    final result = await HelperFunctions.pickMedia(
      context: context,
      bottomSheetTitle: 'Choose an option',
      cameraLabel: 'Take a photo',
      galleryLabel: 'Choose from gallery',
      bottomSheetBorderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      mediaType: MediaType.image,
    );

    if (result != null) {
      log('Selected Image==>>> ${result.singleFile}');
      context.read<OnboardingBloc>().add(SelectUserProfileImageEvent(selectedFile: result.singleFile));
    }
  }
}
