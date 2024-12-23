import 'package:doctor_house/core/firebaseFailure/firebase_failure.dart';
import 'package:doctor_house/models/user_model.dart';

import '../../../../service/firebase_service_exception.dart';

abstract class RegisterScreenState{}

class RegisterScreenInitialState extends RegisterScreenState{}

class RegisterUserEventState extends RegisterScreenState{
  final UserModel user;
  RegisterUserEventState(this.user);
}

class RegisterLoadingState extends RegisterScreenState{}


class RegisterFailureState extends RegisterScreenState{
  final FirebaseFailure firebaseFailure;
  RegisterFailureState(this.firebaseFailure);
}