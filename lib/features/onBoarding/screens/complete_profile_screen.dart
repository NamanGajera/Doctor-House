import 'dart:io';

import 'package:doctor_house/core/constants/colors.dart';
import 'package:doctor_house/core/extension/string_extension.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/widgets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final String _selectedGender = '';
  final bool _termsAccepted = false;
  final String _selectedCountryCode = '+1';

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _showImagePickerBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a photo'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: completeProfileScreen(),
    );
  }

  Widget completeProfileScreen() {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
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
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(55),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: _imageFile != null
                      ? Image.file(
                          _imageFile!,
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
            ).centered(),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// First Name
                  Text(
                    'First Name',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 15),
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
                  Text(
                    'Last Name',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 15),
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
                  Text(
                    'Phone Number',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 15),
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
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Checkbox(
                    // value: completeProfileScreenBloc.isCheck,
                    value: true,
                    onChanged: (val) {
                      // completeProfileScreenBloc.add(ToggleCheckBoxEvent());
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
            ).withPadding(const EdgeInsets.symmetric(horizontal: 18)),
            const SizedBox(height: 50),
            CustomButton(
              label: 'Continue',
              onPressed: () {},
              // textColor: completeProfileScreenBloc.isCheck ? Colors.white : Colors.black,
              // color: completeProfileScreenBloc.isCheck ? primaryBlueColor : Colors.grey.shade400,
              borderRadius: 12,
              width: double.infinity,
              // isLoading: completeProfileScreenBloc.isLoading,
              padding: const EdgeInsets.symmetric(vertical: 11),
            ).centered().withPadding(const EdgeInsets.symmetric(horizontal: 18)),
          ],
        ),
      ),
    );
  }
}
