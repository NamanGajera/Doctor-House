abstract class AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final Map<String, dynamic> registerUserData;

  RegisterUserEvent({required this.registerUserData});
}

class TogglePasswordVisibilityEvent extends AuthEvent {}

class LoginUserEvent extends AuthEvent {
  final Map<String, dynamic> loginUserData;

  LoginUserEvent({required this.loginUserData});
}
