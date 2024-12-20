abstract class OnboardingState {}

class OnboardingInitialState extends OnboardingState{}

class OnboardingPageChangedState extends OnboardingState{
  final int pageIndex;
  OnboardingPageChangedState(this.pageIndex);
}

class OnboardingSkippedState extends OnboardingState{}