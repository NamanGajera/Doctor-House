import 'package:doctor_house/features/auth/bloc/auth_event.dart';
import 'package:doctor_house/features/auth/bloc/auth_state.dart';
import 'package:doctor_house/features/auth/models/auth_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/network/api_exceptions.dart';
import '../../../core/network/api_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiRepository apiRepository;
  final SharedPreferences sharedPreferences;
  bool showPassword = false;

  AuthBloc({
    required this.apiRepository,
    required this.sharedPreferences,
  }) : super(AuthInitialState()) {
    on<LoginUserEvent>(_onLogin);
    on<TogglePasswordVisibilityEvent>(_togglePasswordEvent);
  }

  _togglePasswordEvent(
    TogglePasswordVisibilityEvent event,
    Emitter<AuthState> emit,
  ) {
    showPassword = !showPassword;
    emit(TogglePasswordVisibilityEventState(showPassword));
  }

  Future<void> _onLogin(LoginUserEvent event, Emitter<AuthState> emit) async {
    AuthModel authModel;
    try {
      emit(AuthLoadingState());
      authModel = await apiRepository.login(event.loginUserData);
      emit(LoginUserEventState(authModel));
    } catch (error) {
      _handleError(error, emit);
    }
  }

  void _handleError(dynamic error, Emitter<AuthState> emit) {
    if (error is BadRequestException) {
      emit(AuthFailureState(statusCode: error.statusCode, message: error.message));
    } else if (error is UnauthorizedException) {
      emit(AuthFailureState(statusCode: error.statusCode, message: error.message));
    } else if (error is ForbiddenException) {
      emit(AuthFailureState(statusCode: error.statusCode, message: error.message));
    } else if (error is NotFoundException) {
      emit(AuthFailureState(statusCode: error.statusCode, message: error.message));
    } else if (error is ValidationException) {
      emit(AuthFailureState(statusCode: error.statusCode, message: error.message));
    } else if (error is ServerException) {
      emit(AuthFailureState(statusCode: 500, message: 'No internet connection'));
    } else {
      emit(AuthFailureState(statusCode: 500, message: '$error'));
    }
  }
}
