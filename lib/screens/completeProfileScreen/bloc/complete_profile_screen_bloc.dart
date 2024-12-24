import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_house/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/firebaseFailure/firebase_failure.dart';
import '../../../service/firebase_service_exception.dart';
import '../repository/user_profile_repository.dart';
import 'complete_profile_screen_event.dart';
import 'complete_profile_screen_state.dart';

class CompleteProfileScreenBloc extends Bloc<CompleteProfileScreenEvent, CompleteProfileScreenState> {
  bool isCheck = false;
  bool isLoading = false;
  final UserProfileRepository userProfileRepository;

  CompleteProfileScreenBloc(this.userProfileRepository) : super(CompleteProfileScreenInitState()) {
    on<ToggleCheckBoxEvent>(_toggleCheckBox);
    on<AddUserProfileDataEvent>(_addUserData);
  }

  void _toggleCheckBox(ToggleCheckBoxEvent event, Emitter<CompleteProfileScreenState> emit) {
    isCheck = !isCheck;
    emit(ToggleCheckBoxEventState(isCheck));
  }

  Future<void> _addUserData(AddUserProfileDataEvent event, Emitter<CompleteProfileScreenState> emit) async {
    isLoading = true;
    emit(LoadingState(isLoading));
    try{
      log('Image===  ${event.userProfileData['imageFile']}');


      // final String userProfileImage = await userProfileRepository.uploadProfilePicture(
      //   event.userProfileData['id'],
      //   event.userProfileData['imageFile'],
      // );

      UserModel user = UserModel(
        id: event.userProfileData['id'],
        firstName: event.userProfileData['firstName'],
        lastName: event.userProfileData['lastName'],
        phoneNumber: event.userProfileData['phoneNumber'],
        profilePicture: '123',
      );

      await userProfileRepository.updateUser(user);

      isLoading = false;
      emit(LoadingState(isLoading));
      emit(AddUserProfileDataEventState(user));
    }on FirebaseException catch (e) {
      isLoading = false;
      emit(LoadingState(isLoading));
      emit(CompleteProfileScreenErrorState(FirebaseErrorHandler.handle(e)));
    } catch (e) {
      isLoading = false;
      emit(LoadingState(isLoading));
      emit(CompleteProfileScreenErrorState(FirebaseFailure(message: 'Something went wrong!')));
    }
  }
}
