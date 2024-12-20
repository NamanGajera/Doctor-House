abstract class RegisterScreenEvent{}

class RegisterUserEvent extends RegisterScreenEvent{
  final String userName;
  final String userEmail;
  final String userPassword;


  RegisterUserEvent(this.userEmail,this.userName,this.userPassword);
}
