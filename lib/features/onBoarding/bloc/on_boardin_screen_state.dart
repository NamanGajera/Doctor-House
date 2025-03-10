import 'package:doctor_house/features/onBoarding/model/complete_profile_model.dart';
import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final bool isChecked;
  final int pageIndex;
  final String? selectedGender;
  final bool showLoader;

  const OnboardingState({
    this.isChecked = false,
    this.pageIndex = 0,
    this.selectedGender,
    this.showLoader = false,
  });

  OnboardingState copyWith({
    bool? isChecked,
    int? pageIndex,
    String? selectedGender,
    bool? showLoader,
  }) {
    return OnboardingState(
      isChecked: isChecked ?? this.isChecked,
      pageIndex: pageIndex ?? this.pageIndex,
      selectedGender: selectedGender ?? this.selectedGender,
      showLoader: showLoader ?? this.showLoader,
    );
  }

  @override
  List<Object?> get props => [
        isChecked,
        pageIndex,
        selectedGender,
        showLoader,
      ];
}

class AuthFailureState extends OnboardingState {
  final dynamic statusCode;
  final dynamic message;

  const AuthFailureState({this.message, this.statusCode});
}

class OnboardingInitialState extends OnboardingState {}

class OnboardingSkippedState extends OnboardingState {}

class CompleteProfileEventState extends OnboardingState {
  final CompleteProfileModel completeProfileModel;

  const CompleteProfileEventState(this.completeProfileModel);
}
