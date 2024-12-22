abstract class CompleteProfileScreenState{}

class CompleteProfileScreenInitState extends CompleteProfileScreenState{}

class ToggleCheckBoxEventState extends CompleteProfileScreenState{
  final bool isCheck;
  ToggleCheckBoxEventState(this.isCheck);
}