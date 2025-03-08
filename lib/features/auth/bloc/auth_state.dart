import 'package:doctor_house/features/auth/models/auth_model.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class RegisterUserEventState extends AuthState {
  final AuthModel authModel;

  RegisterUserEventState(this.authModel);
}

class AuthFailureState extends AuthState {
  final dynamic statusCode;
  final dynamic message;

  AuthFailureState({this.message, this.statusCode});
}

class TogglePasswordVisibilityEventState extends AuthState {
  final bool showPassword;

  TogglePasswordVisibilityEventState(this.showPassword);
}

class LoginUserEventState extends AuthState {
  final AuthModel authModel;

  LoginUserEventState(this.authModel);
}
