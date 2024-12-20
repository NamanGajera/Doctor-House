import 'package:doctor_house/bloc/authScreenBloc/registerScreenBloc/register_screen_event.dart';
import 'package:doctor_house/bloc/authScreenBloc/registerScreenBloc/register_screen_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/firebaseFailure/firebase_failure.dart';
import '../../../service/firebase_auth_service.dart';

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
          const UnknownFailure('Registration failed for unknown reason'),
        ));
      }
    }on FirebaseAuthException catch(e){
      emit(RegisterFailureState(handleFirebaseException(e)));
    } catch(e){
      emit(RegisterFailureState(UnknownFailure(e.toString())));
    }
  }
}



