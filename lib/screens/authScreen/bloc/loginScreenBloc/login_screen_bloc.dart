import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_house/core/firebaseFailure/firebase_failure.dart';
import 'package:doctor_house/screens/authScreen/services/firebase_auth_service.dart';
import 'package:doctor_house/screens/authScreen/services/supabase_auth_service.dart';
import 'package:doctor_house/service/firebase_service_exception.dart';
import 'package:doctor_house/service/supabase_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'login_screen_event.dart';
import 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  bool showPassword = false;
  final SupabaseAuthService _authService;

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
      }
    } on AuthException catch (e) {
      log('Login Error ${e}');
      emit(FailureState(SupabaseErrorHandler.handle(e)));
    } catch (e) {
      log('Login Error ${e}');
      emit(FailureState(SupabaseFailure(message:  'Login Error ${e}')));
    }
  }
}
