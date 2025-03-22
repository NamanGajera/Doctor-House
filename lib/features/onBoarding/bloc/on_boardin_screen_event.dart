import 'dart:io';

abstract class OnboardingEvent {}

class OnboardingPageChangedEvent extends OnboardingEvent {
  final int index;

  OnboardingPageChangedEvent(this.index);
}

class SkipOnboardingEvent extends OnboardingEvent {}

class ToggleConformationCheckBoxEvent extends OnboardingEvent {}

class SelectGenderEvent extends OnboardingEvent {
  final String? selectedGender;

  SelectGenderEvent(this.selectedGender);
}

class CompleteProfileEvent extends OnboardingEvent {
  final Map<String, dynamic> completeProfileBody;

  CompleteProfileEvent(this.completeProfileBody);
}

class SelectUserProfileImageEvent extends OnboardingEvent {
  final File? selectedFile;

  SelectUserProfileImageEvent({required this.selectedFile});
}
