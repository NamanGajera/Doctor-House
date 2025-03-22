import 'package:doctor_house/features/auth/models/auth_model.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool showLoader;
  final AuthModel? registerUserModel;
  final bool showPassword;
  final AuthModel? loginUserModel;

  const AuthState({
    this.showLoader = false,
    this.registerUserModel,
    this.loginUserModel,
    this.showPassword = false,
  });

  AuthState copyWith({
    bool? showLoader,
    AuthModel? registerUserModel,
    bool? showPassword,
    AuthModel? loginUserModel,
  }) {
    return AuthState(
      showLoader: showLoader ?? this.showLoader,
      registerUserModel: registerUserModel ?? this.registerUserModel,
      showPassword: showPassword ?? this.showPassword,
      loginUserModel: loginUserModel ?? this.loginUserModel,
    );
  }

  @override
  List<Object?> get props => [
        showLoader,
        registerUserModel,
        showPassword,
        loginUserModel,
      ];
}

class AuthInitialState extends AuthState {}

class AuthFailureState extends AuthState {
  final dynamic statusCode;
  final dynamic message;

  AuthFailureState({this.message, this.statusCode});
}
