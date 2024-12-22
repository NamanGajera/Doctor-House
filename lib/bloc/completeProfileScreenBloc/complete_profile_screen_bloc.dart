import 'package:doctor_house/bloc/completeProfileScreenBloc/complete_profile_screen_event.dart';
import 'package:doctor_house/bloc/completeProfileScreenBloc/complete_profile_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteProfileScreenBloc extends Bloc<CompleteProfileScreenEvent,CompleteProfileScreenState>{
  bool isCheck = false;
  CompleteProfileScreenBloc():super(CompleteProfileScreenInitState()){
    on<ToggleCheckBoxEvent>(_toggleCheckBox);
  }

  _toggleCheckBox(ToggleCheckBoxEvent event, Emitter<CompleteProfileScreenState> emit){
    isCheck = !isCheck;
    emit(ToggleCheckBoxEventState(isCheck));
  }

}