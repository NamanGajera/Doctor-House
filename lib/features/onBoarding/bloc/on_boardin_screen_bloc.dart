import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../onBoarding/bloc/on_boardin_screen_event.dart';
import '../../onBoarding/bloc/on_boardin_screen_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final SharedPreferences sharedPreferences;
  static const String onboardingCompletedKey = 'onboarding_completed';

  OnboardingBloc({required this.sharedPreferences}) : super(OnboardingInitialState()) {
    // Event handlers
    on<OnboardingPageChangedEvent>(_onPageChange);
    on<SkipOnboardingEvent>(_onSkipOnboarding);
  }

  void _onSkipOnboarding(SkipOnboardingEvent event, Emitter<OnboardingState> emit) {
    // Mark onboarding as completed and move to last page
    emit(OnboardingSkippedState());
    sharedPreferences.setBool(onboardingCompletedKey, true);
  }

  void _onPageChange(OnboardingPageChangedEvent event, Emitter<OnboardingState> emit) {
    // Mark onboarding as completed and move to last page
    emit(OnboardingPageChangedState(event.index));
    sharedPreferences.setBool(onboardingCompletedKey, true);
  }
}
