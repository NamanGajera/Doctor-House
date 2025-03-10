import 'dart:developer';

import 'package:doctor_house/features/onBoarding/model/complete_profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network/api_exceptions.dart';
import '../../../core/network/api_repository.dart';
import '../../onBoarding/bloc/on_boardin_screen_event.dart';
import '../../onBoarding/bloc/on_boardin_screen_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final ApiRepository apiRepository;

  OnboardingBloc({required this.apiRepository}) : super(OnboardingInitialState()) {
    on<OnboardingPageChangedEvent>(_onPageChange);
    on<SkipOnboardingEvent>(_onSkipOnboarding);
    on<ToggleConformationCheckBoxEvent>(_toggleConformationCheckBox);
    on<SelectGenderEvent>(_selectGender);
    on<CompleteProfileEvent>(_completeProfile);
  }

  void _onSkipOnboarding(SkipOnboardingEvent event, Emitter<OnboardingState> emit) {
    emit(OnboardingSkippedState());
  }

  void _onPageChange(OnboardingPageChangedEvent event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(pageIndex: event.index));
  }

  void _toggleConformationCheckBox(ToggleConformationCheckBoxEvent even, Emitter<OnboardingState> emit) {
    emit(state.copyWith(isChecked: !state.isChecked));
  }

  void _selectGender(SelectGenderEvent event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(selectedGender: event.selectedGender));
  }

  Future<void> _completeProfile(CompleteProfileEvent event, Emitter<OnboardingState> emit) async {
    emit(state.copyWith(showLoader: true));
    try {
      CompleteProfileModel completeProfileModel = await apiRepository.completeProfile(event.completeProfileBody);
    } catch (error, stackTrace) {
      log('Error==>> $error == > $stackTrace');
      _handleError(error, emit);
    }
  }

  void _handleError(dynamic error, Emitter<OnboardingState> emit) {
    emit(state.copyWith(showLoader: false));
    if (error is BadRequestException) {
      emit(AuthFailureState(statusCode: error.statusCode, message: error.message));
    } else if (error is UnauthorizedException) {
      emit(AuthFailureState(statusCode: error.statusCode, message: error.message));
    } else if (error is ForbiddenException) {
      emit(AuthFailureState(statusCode: error.statusCode, message: error.message));
    } else if (error is NotFoundException) {
      emit(AuthFailureState(statusCode: error.statusCode, message: error.message));
    } else if (error is ValidationException) {
      emit(AuthFailureState(statusCode: error.statusCode, message: error.message));
    } else if (error is ServerException) {
      emit(AuthFailureState(statusCode: 500, message: 'No internet connection'));
    } else {
      emit(AuthFailureState(statusCode: 500, message: '$error'));
    }
  }
}
