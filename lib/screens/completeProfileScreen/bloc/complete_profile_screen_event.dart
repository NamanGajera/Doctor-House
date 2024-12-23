abstract class CompleteProfileScreenEvent{}

class ToggleCheckBoxEvent extends CompleteProfileScreenEvent{}

class AddUserProfileDataEvent extends CompleteProfileScreenEvent{
  final Map<String,dynamic> userProfileData;
  AddUserProfileDataEvent(this.userProfileData);
}