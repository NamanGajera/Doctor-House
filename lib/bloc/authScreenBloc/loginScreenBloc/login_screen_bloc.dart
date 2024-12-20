import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_house/core/firebaseFailure/firebase_failure.dart';
import 'package:doctor_house/service/firebase_auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_screen_event.dart';
import 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  bool showPassword = false;
  final FirebaseAuthService _authService;

  LoginScreenBloc(this._authService) : super(LoginScreenInitialState()) {
    on<TogglePasswordVisibilityEvent>(_togglePasswordEvent);
    on<LoginUserEvent>(_userLogin);
  }

  _togglePasswordEvent(
      TogglePasswordVisibilityEvent event,
      Emitter<LoginScreenState> emit,
      ) {
    showPassword = !showPassword;
    emit(TogglePasswordVisibilityEventState(showPassword));
  }

  _userLogin(
      LoginUserEvent event,
      Emitter<LoginScreenState> emit,
      ) async {
    emit(LoginUserLoadingState());

    try {
      final user = await _authService.loginWithEmail(
        event.email,
        event.password,
      );

      if (user != null) {
        emit(LoginUserEventState(user));
      } else {
        emit(FailureState(
          const UnknownFailure('Login Failed'),
        ));
      }
    } on FirebaseException catch (e) {
      log('Login Error ${e}');
      emit(FailureState(handleFirebaseException(e)));
    } catch (e) {
      log('Login Error ${e}');
      emit(FailureState(UnknownFailure(e.toString())));
    }
  }
}
