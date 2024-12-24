import 'package:doctor_house/models/user_model.dart';
import 'package:doctor_house/service/supabase_exception.dart';

import '../../../../core/firebaseFailure/firebase_failure.dart';
import '../../../../service/firebase_service_exception.dart';

abstract class LoginScreenState {}

class LoginScreenInitialState extends LoginScreenState{}

class TogglePasswordVisibilityEventState extends LoginScreenState {
  final bool showPassword;
  TogglePasswordVisibilityEventState(this.showPassword);
}

class FailureState extends LoginScreenState{
  final SupabaseFailure firebaseFailure;
  FailureState(this.firebaseFailure);
}

class LoginUserLoadingState extends LoginScreenState{}

class LoginUserEventState extends LoginScreenState{
  final UserModel userModel;
  LoginUserEventState(this.userModel);
}

