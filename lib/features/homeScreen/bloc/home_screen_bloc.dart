import 'dart:developer';

import 'package:doctor_house/features/homeScreen/model/doctor_category_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/network/api_exceptions.dart';
import '../../../core/network/api_repository.dart';
import '../model/get_upcoming_schedule_data_model.dart';
import '../model/top_doctor_data_model.dart';
import '../model/trusted_hospital_data_model.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final ApiRepository apiRepository;

  HomeScreenBloc({required this.apiRepository}) : super(HomeScreenInitialState()) {
    on<GetDoctorCategoryEvent>(_getDoctorCategory);
    on<GetUpcomingScheduleEvent>(_getUpcomingSchedule);
    on<GetTopSpecialistsEvent>(_getTopSpecialists);
    on<GetTrustedHospitalEvent>(_getTrustedHospital);
    on<ToggleDoctorLikeEvent>(_toggleDoctorLike);
    on<ToggleHospitalLikeEvent>(_toggleHospitalLike);
  }

  Future<void> _getDoctorCategory(GetDoctorCategoryEvent event, Emitter<HomeScreenState> emit) async {
    DoctorCategoryDataModel doctorCategoryModel;
    emit(state.copyWith(showCategoryLoader: true));
    try {
      doctorCategoryModel = await apiRepository.getDoctorCategory();
      emit(state.copyWith(
        showCategoryLoader: false,
        doctorCategoryData: doctorCategoryModel.doctorCategoryData ?? [],
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(showCategoryLoader: false));
      log('Error=> $error ==> $stackTrace');
      _handleError(error, emit);
    }
  }

  Future<void> _getUpcomingSchedule(GetUpcomingScheduleEvent event, Emitter<HomeScreenState> emit) async {
    GetUpcomingScheduleDataModel getUpcomingScheduleDataModel;
    emit(state.copyWith(showUpcomingLoader: true));
    try {
      getUpcomingScheduleDataModel = await apiRepository.getUpcomingSchedule(event.upcomingDataBody);
      emit(state.copyWith(
        showUpcomingLoader: false,
        upcomingAppointment: getUpcomingScheduleDataModel.appointmentData,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(showUpcomingLoader: false));
      log('Error=> $error ==> $stackTrace');
      _handleError(error, emit);
    }
  }

  Future<void> _getTopSpecialists(GetTopSpecialistsEvent event, Emitter<HomeScreenState> emit) async {
    TopDoctorsDataModel topDoctorsDataModel;
    emit(state.copyWith(showTopDoctorLoader: true));
    try {
      topDoctorsDataModel = await apiRepository.getTopSpecialist();
      emit(state.copyWith(
        showTopDoctorLoader: false,
        topDoctor: topDoctorsDataModel.topDoctor,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(showTopDoctorLoader: false));
      log('Error=> $error ==> $stackTrace');
      _handleError(error, emit);
    }
  }

  Future<void> _getTrustedHospital(GetTrustedHospitalEvent event, Emitter<HomeScreenState> emit) async {
    TrustedHospitalDataModel trustedHospitalDataModel;
    emit(state.copyWith(showTrustedHospitalLoader: true));
    try {
      trustedHospitalDataModel = await apiRepository.getTrustedHospital();
      emit(state.copyWith(
        showTrustedHospitalLoader: false,
        trustedHospital: trustedHospitalDataModel.topHospital,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(showTrustedHospitalLoader: false));
      log('Error=> $error ==> $stackTrace');
      _handleError(error, emit);
    }
  }

  Future<void> _toggleDoctorLike(ToggleDoctorLikeEvent event, Emitter<HomeScreenState> emit) async {
    log('Toggle Doctor Like Data ==>>> ${{
      'DoctorId': event.doctorId,
      'isLike': event.isLike,
    }}');
    final updatedDoctor = (state.topDoctor ?? []).map((doctor) {
      if (doctor.id == event.doctorId) {
        return doctor.copyWith(isLiked: event.isLike);
      }
      return doctor;
    }).toList();

    emit(state.copyWith(topDoctor: updatedDoctor));

    try {
      await apiRepository.toggleDoctorLike({
        "doctorId": event.doctorId,
        "isLiked": event.isLike,
      });
    } catch (error, stackTrace) {
      final reverseDoctor = (state.topDoctor ?? []).map((doctor) {
        if (doctor.id == event.doctorId) {
          return doctor.copyWith(isLiked: !(doctor.isLiked ?? false));
        }
        return doctor;
      }).toList();

      emit(state.copyWith(topDoctor: reverseDoctor));
      log('Error=> $error ==> $stackTrace');
      _handleError(error, emit);
    }
  }

  Future<void> _toggleHospitalLike(ToggleHospitalLikeEvent event, Emitter<HomeScreenState> emit) async {
    log('Toggle Hospital Data ==> ${{
      "hospitalId": event.hospitalId,
      "isLiked": event.isLike,
    }}');

    final updatedHospitalData = (state.trustedHospital ?? []).map((hospital) {
      if (hospital.id == event.hospitalId) {
        return hospital.copyWith(isLiked: event.isLike);
      }
      return hospital;
    }).toList();

    emit(state.copyWith(trustedHospital: updatedHospitalData));

    try {
      await apiRepository.toggleHospitalLike({
        "hospitalId": event.hospitalId,
        "isLiked": event.isLike,
      });
    } catch (error, stackTrace) {
      final reverseHospital = (state.trustedHospital ?? []).map((hospital) {
        if (hospital.id == event.hospitalId) {
          return hospital.copyWith(isLiked: !event.isLike);
        }
        return hospital;
      }).toList();

      emit(state.copyWith(trustedHospital: reverseHospital));
      log('Error=> $error ==> $stackTrace');
      _handleError(error, emit);
    }
  }

  void _handleError(dynamic error, Emitter<HomeScreenState> emit) {
    emit(state.copyWith(showCategoryLoader: false));
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
      emit(const AuthFailureState(statusCode: 500, message: 'No internet connection'));
    } else {
      emit(AuthFailureState(statusCode: 500, message: '$error'));
    }
  }
}
