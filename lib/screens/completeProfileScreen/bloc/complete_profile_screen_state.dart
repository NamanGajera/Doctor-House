import 'package:doctor_house/models/user_model.dart';
import 'package:doctor_house/service/supabase_exception.dart';

abstract class CompleteProfileScreenState{}

class CompleteProfileScreenInitState extends CompleteProfileScreenState{}

class CompleteProfileScreenErrorState extends CompleteProfileScreenState{
  final SupabaseFailure firebaseFailure;
  CompleteProfileScreenErrorState(this.firebaseFailure);
}

class LoadingState extends CompleteProfileScreenState{
  final bool isCheck;
  LoadingState(this.isCheck);
}

class ToggleCheckBoxEventState extends CompleteProfileScreenState{
  final bool isCheck;
  ToggleCheckBoxEventState(this.isCheck);
}

class AddUserProfileDataEventState extends CompleteProfileScreenState{
  final UserModel userModel;
  AddUserProfileDataEventState(this.userModel);
}