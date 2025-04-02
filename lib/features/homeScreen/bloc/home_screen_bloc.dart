import 'dart:developer';

import 'package:doctor_house/commonModel/doctor_details_data_model.dart';
import 'package:doctor_house/features/homeScreen/model/doctor_by_id_model.dart';
import 'package:doctor_house/features/homeScreen/model/doctor_category_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../commonModel/category_data_model.dart';
import '../../../commonModel/hospital_details_data_model.dart';
import '../../../core/network/api_exceptions.dart';
import '../../../core/network/api_repository.dart';
import '../model/doctor-by_category_id_data_model.dart';
import '../model/get_upcoming_schedule_data_model.dart';
import '../model/hospital_by_id_data_model.dart';
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
    on<SelectDoctorCategoryEvent>(_selectDoctorCategory);
    on<GetDoctorDataByCategoryIdEvent>(_getDoctorDataByCategoryId);
    on<GetDoctorByIdEvent>(_getDoctorById);
    on<GetHospitalByIdEvent>(_getHospitalById);
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

  Future<void> _getDoctorDataByCategoryId(GetDoctorDataByCategoryIdEvent event, Emitter<HomeScreenState> emit) async {
    DoctorByCategoryIdDataModel doctorByCategoryIdDataModel;
    emit(state.copyWith(showDoctorCategoryDataLoader: true));
    try {
      doctorByCategoryIdDataModel = await apiRepository.getDoctorByCategoryId(event.categoryId);
      emit(state.copyWith(
        showDoctorCategoryDataLoader: false,
        doctorDataByCategoryId: doctorByCategoryIdDataModel.doctorData,
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

    _updateDoctorLikeStatus(doctorId: event.doctorId, isLike: event.isLike, emit: emit);

    try {
      await apiRepository.toggleDoctorLike({
        "doctorId": event.doctorId,
        "isLiked": event.isLike,
      });
    } catch (error, stackTrace) {
      _updateDoctorLikeStatus(doctorId: event.doctorId, isLike: !event.isLike, emit: emit);

      log('Error=> $error ==> $stackTrace');
      _handleError(error, emit);
    }
  }

  Future<void> _toggleHospitalLike(ToggleHospitalLikeEvent event, Emitter<HomeScreenState> emit) async {
    log('Toggle Hospital Data ==> ${{
      "hospitalId": event.hospitalId,
      "isLiked": event.isLike,
    }}');

    _updateHospitalLikeStatus(
      hospitalId: event.hospitalId,
      isLike: event.isLike,
      emit: emit,
    );

    try {
      await apiRepository.toggleHospitalLike({
        "hospitalId": event.hospitalId,
        "isLiked": event.isLike,
      });
    } catch (error, stackTrace) {
      _updateHospitalLikeStatus(
        hospitalId: event.hospitalId,
        isLike: !event.isLike,
        emit: emit,
      );
      log('Error=> $error ==> $stackTrace');
      _handleError(error, emit);
    }
  }

  Future<void> _getDoctorById(GetDoctorByIdEvent event, Emitter<HomeScreenState> emit) async {
    DoctorByIdModel doctorByIdModel;
    emit(state.copyWith(showDoctorDataFetchLoader: true));
    try {
      doctorByIdModel = await apiRepository.getDoctorById(event.doctorId);
      emit(state.copyWith(
        showDoctorDataFetchLoader: false,
        doctorData: doctorByIdModel.doctorData,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(showTrustedHospitalLoader: false));
      log('Error=> $error ==> $stackTrace');
      _handleError(error, emit);
    }
  }

  Future<void> _getHospitalById(GetHospitalByIdEvent event, Emitter<HomeScreenState> emit) async {
    HospitalByIdDataModel hospitalByIdDataModel;
    emit(state.copyWith(showHospitalDataFetchLoader: true));
    try {
      hospitalByIdDataModel = await apiRepository.getHospitalById(event.hospitalId);
      emit(state.copyWith(
        showHospitalDataFetchLoader: false,
        hospitalData: hospitalByIdDataModel.hospitalData,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(showTrustedHospitalLoader: false));
      log('Error=> $error ==> $stackTrace');
      _handleError(error, emit);
    }
  }

  Future<void> _selectDoctorCategory(SelectDoctorCategoryEvent event, Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(selectedDoctorCategoryId: event.categoryId ?? '1'));
  }

  void _updateDoctorLikeStatus({String doctorId = '', bool isLike = false, required Emitter<HomeScreenState> emit}) {
    emit(state.copyWith(
      topDoctor: _getUpdatedDoctorDataForChangeLike(state.topDoctor ?? [], doctorId, isLike),
      doctorDataByCategoryId: _getUpdatedDoctorDataForChangeLike(state.doctorDataByCategoryId ?? [], doctorId, isLike),
      hospitalData: state.hospitalData?.copyWith(
        doctors: _getUpdatedDoctorDataForChangeLike(state.hospitalData?.doctors ?? [], doctorId, isLike),
      ),
    ));
  }

  List<DoctorDetailsData> _getUpdatedDoctorDataForChangeLike(List<DoctorDetailsData> doctorList, String doctorId, bool isLike) {
    return (doctorList).map((doctor) {
      if (doctor.id == doctorId) {
        return doctor.copyWith(isLiked: isLike);
      }
      return doctor;
    }).toList();
  }

  void _updateHospitalLikeStatus({String hospitalId = '', bool isLike = false, required Emitter<HomeScreenState> emit}) {
    emit(state.copyWith(
      trustedHospital: _getUpdatedHospitalDataForChangeLike(state.trustedHospital ?? [], hospitalId, isLike),
      hospitalData: state.hospitalData?.copyWith(isLiked: isLike),
    ));
  }

  List<HospitalDetailsData> _getUpdatedHospitalDataForChangeLike(List<HospitalDetailsData> hospitalList, String hospitalId, bool isLike) {
    return (hospitalList).map((hospital) {
      if (hospital.id == hospitalId) {
        return hospital.copyWith(isLiked: isLike);
      }
      return hospital;
    }).toList();
  }

  void _handleError(dynamic error, Emitter<HomeScreenState> emit) {
    emit(state.copyWith(
      showCategoryLoader: false,
      showDoctorDataFetchLoader: false,
      showDoctorCategoryDataLoader: false,
      showTopDoctorLoader: false,
      showUpcomingLoader: false,
      showTrustedHospitalLoader: false,
      showHospitalDataFetchLoader: false,
    ));
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
