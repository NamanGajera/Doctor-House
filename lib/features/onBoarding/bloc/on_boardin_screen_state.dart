import 'dart:io';

import 'package:doctor_house/features/onBoarding/model/complete_profile_model.dart';
import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final bool isChecked;
  final int pageIndex;
  final String? selectedGender;
  final bool showLoader;
  final CompleteProfileModel? completeProfileModel;
  final File? selectedUserProfileImage;

  const OnboardingState({
    this.isChecked = false,
    this.pageIndex = 0,
    this.selectedGender,
    this.showLoader = false,
    this.completeProfileModel,
    this.selectedUserProfileImage,
  });

  OnboardingState copyWith({
    bool? isChecked,
    int? pageIndex,
    String? selectedGender,
    bool? showLoader,
    CompleteProfileModel? completeProfileModel,
    File? selectedUserProfileImage,
  }) {
    return OnboardingState(
      isChecked: isChecked ?? this.isChecked,
      pageIndex: pageIndex ?? this.pageIndex,
      selectedGender: selectedGender ?? this.selectedGender,
      showLoader: showLoader ?? this.showLoader,
      completeProfileModel: completeProfileModel ?? this.completeProfileModel,
      selectedUserProfileImage: selectedUserProfileImage ?? this.selectedUserProfileImage,
    );
  }

  @override
  List<Object?> get props => [
        isChecked,
        pageIndex,
        selectedGender,
        showLoader,
        completeProfileModel,
        selectedUserProfileImage,
      ];
}

class AuthFailureState extends OnboardingState {
  final dynamic statusCode;
  final dynamic message;

  const AuthFailureState({this.message, this.statusCode});
}

class OnboardingInitialState extends OnboardingState {}

class OnboardingSkippedState extends OnboardingState {}
