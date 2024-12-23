abstract class OnboardingEvent {}

class OnboardingPageChangedEvent extends OnboardingEvent{
  final int index;
  OnboardingPageChangedEvent(this.index);
}

class SkipOnboardingEvent extends OnboardingEvent {}