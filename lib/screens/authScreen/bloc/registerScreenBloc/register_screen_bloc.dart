import 'dart:developer';

import 'package:doctor_house/screens/authScreen/bloc/registerScreenBloc/register_screen_event.dart';
import 'package:doctor_house/screens/authScreen/bloc/registerScreenBloc/register_screen_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/firebaseFailure/firebase_failure.dart';
import '../../../../service/firebase_service_exception.dart';
import '../../services/firebase_auth_service.dart';

class RegisterScreenBloc extends Bloc<RegisterScreenEvent, RegisterScreenState> {
  final FirebaseAuthService _authService;
  RegisterScreenBloc(this._authService) : super(RegisterScreenInitialState()) {
    on<RegisterUserEvent>(_registerUser);
  }

  _registerUser(RegisterUserEvent event, Emitter<RegisterScreenState> emit) async {
    emit(RegisterLoadingState());

    try{
      final user = await _authService.registerWithEmail(
        event.userEmail,
        event.userPassword,
        event.userName
      );

      if (user != null) {
        emit(RegisterUserEventState(user));
      } else {
        emit(RegisterFailureState(
            FirebaseFailure(message: 'Registration failed for unknown reason')
        ));
      }
    }on FirebaseException catch (e) {
      log('Login Error ${e}');
      emit(RegisterFailureState(FirebaseErrorHandler.handle(e)));
    } catch (e) {
      log('Login Error ${e}');
      emit(RegisterFailureState(FirebaseFailure(message:  'Login Error ${e}')));
    }
  }
}



