abstract class LoginScreenEvent {}

class TogglePasswordVisibilityEvent extends LoginScreenEvent {}

class LoginUserEvent extends LoginScreenEvent{
  final String email;
  final String password;

  LoginUserEvent(this.email,this.password);
}

