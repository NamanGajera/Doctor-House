import 'dart:developer';

import 'package:doctor_house/models/user_model.dart';
import 'package:doctor_house/service/supabase_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    try {
      log('Image===  ${event.userProfileData['imageFile']}');
      log('Image===  ${event.userProfileData['id']}');

      final String userProfileImage = await userProfileRepository.uploadProfilePicture(
        event.userProfileData['id'],
        event.userProfileData['imageFile'],
      );

      log('userProfileImage===  $userProfileImage');

      UserModel user = UserModel(
        id: event.userProfileData['id'],
        firstName: event.userProfileData['firstName'],
        lastName: event.userProfileData['lastName'],
        phoneNumber: event.userProfileData['phoneNumber'],
        profilePicture: userProfileImage,
        isProfileDone: true,
      );

      await userProfileRepository.updateUser(user);

      isLoading = false;
      emit(LoadingState(isLoading));
      emit(AddUserProfileDataEventState(user));
    } on AuthException catch (e) {
      isLoading = false;
      emit(LoadingState(isLoading));
      emit(CompleteProfileScreenErrorState(SupabaseErrorHandler.handle(e)));
    } on StorageException catch (e) {
      isLoading = false;
      emit(LoadingState(isLoading));
      emit(CompleteProfileScreenErrorState(SupabaseFailure(message: 'Failed to upload image: ${e.message}')));
    } catch (e, stackTrace) {
      log('Upload error: ${e.toString()}');
      log('StackTrace: $stackTrace');
      isLoading = false;
      emit(LoadingState(isLoading));
      emit(CompleteProfileScreenErrorState(SupabaseFailure(message: 'Something went wrong!')));
    }
  }
}
