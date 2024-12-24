import 'dart:developer';

import 'package:doctor_house/screens/authScreen/bloc/registerScreenBloc/register_screen_event.dart';
import 'package:doctor_house/screens/authScreen/bloc/registerScreenBloc/register_screen_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/firebaseFailure/firebase_failure.dart';
import '../../../../service/firebase_service_exception.dart';
import '../../../../service/supabase_exception.dart';
import '../../services/firebase_auth_service.dart';
import '../../services/supabase_auth_service.dart';

class RegisterScreenBloc extends Bloc<RegisterScreenEvent, RegisterScreenState> {
  final SupabaseAuthService _authService;
  RegisterScreenBloc(this._authService) : super(RegisterScreenInitialState()) {
    on<RegisterUserEvent>(_registerUser);
  }

  _registerUser(RegisterUserEvent event, Emitter<RegisterScreenState> emit) async {
    emit(RegisterLoadingState());

    try{
      final user = await _authService.registerWithEmail(
        event.userEmail,
        event.userPassword,
        event.userName,
      );

      log('Use Data===>> ${user}');

      if (user != null) {
        emit(RegisterUserEventState(user));
      }
    }on AuthException catch (e) {
      log('Registration Error: ${e}');
      emit(RegisterFailureState(SupabaseErrorHandler.handle(e)));
    } catch (e) {
      log('Registration Error: ${e}');
      emit(RegisterFailureState(SupabaseFailure(message:  'Registration Error ${e}')));
    }
  }
}



