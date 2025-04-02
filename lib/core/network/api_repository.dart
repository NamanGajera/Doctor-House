import 'dart:developer';

import 'package:doctor_house/features/homeScreen/model/doctor-by_category_id_data_model.dart';
import 'package:doctor_house/features/homeScreen/model/get_upcoming_schedule_data_model.dart';
import 'package:doctor_house/features/homeScreen/model/hospital_by_id_data_model.dart';
import 'package:doctor_house/features/homeScreen/model/trusted_hospital_data_model.dart';

import '../../commonModel/success_response_model.dart';
import '../../features/auth/models/auth_model.dart';
import '../../features/homeScreen/model/doctor_by_id_model.dart';
import '../../features/homeScreen/model/doctor_category_data_model.dart';
import '../../features/homeScreen/model/top_doctor_data_model.dart';
import '../../features/onBoarding/model/complete_profile_model.dart';
import '../constants/api_end_point.dart';
import 'api_service.dart';

class ApiRepository {
  final ApiService _apiService;

  ApiRepository(this._apiService);

  /// POST: Login User
  Future<AuthModel> login(dynamic loginData) async {
    try {
      Map<String, dynamic> response = await _apiService.post(loginUserEndPoint, body: loginData);
      AuthModel authModel = AuthModel.fromJson(response);
      log("Login Data ==>> ${authModel.toJson()}");
      return authModel;
    } catch (e) {
      rethrow;
    }
  }

  /// POST: Register User
  Future<AuthModel> registerUser(dynamic loginData) async {
    try {
      Map<String, dynamic> response = await _apiService.post(registerUserEndPoint, body: loginData);
      AuthModel authModel = AuthModel.fromJson(response);
      log("Register Data ==>> ${authModel.toJson()}");
      return authModel;
    } catch (e) {
      rethrow;
    }
  }

  /// POST: Complete Profile
  Future<CompleteProfileModel> completeProfile(dynamic body) async {
    try {
      Map<String, dynamic> response = await _apiService.multipartPost(completeProfileEndPoint, body);
      CompleteProfileModel completeProfileModel = CompleteProfileModel.fromJson(response);
      log('Complete Profile Data ==>> ${completeProfileModel.toJson()}');
      return completeProfileModel;
    } catch (e) {
      rethrow;
    }
  }

  /// GET: DOCTOR CATEGORY
  Future<DoctorCategoryDataModel> getDoctorCategory() async {
    try {
      Map<String, dynamic> response = await _apiService.get(getDoctorCategoryEndPoint);
      DoctorCategoryDataModel doctorCategoryDataModel = DoctorCategoryDataModel.fromJson(response);
      log('Get Doctor Category Data ==>>> ${doctorCategoryDataModel.toJson()}');
      return doctorCategoryDataModel;
    } catch (e) {
      rethrow;
    }
  }

  /// POST: UPCOMING SCHEDULE
  Future<GetUpcomingScheduleDataModel> getUpcomingSchedule(dynamic body) async {
    try {
      Map<String, dynamic> response = await _apiService.post(getUpcomingAppointmentEndPoint, body: body);
      GetUpcomingScheduleDataModel getUpcomingScheduleDataModel = GetUpcomingScheduleDataModel.fromJson(response);
      log('Get Upcoming Data ==>>> ${getUpcomingScheduleDataModel.toJson()}');
      return getUpcomingScheduleDataModel;
    } catch (e) {
      rethrow;
    }
  }

  /// GET: TOP SPECIALIST
  Future<TopDoctorsDataModel> getTopSpecialist() async {
    try {
      Map<String, dynamic> response = await _apiService.get(getTopSpecialistEndPoint);
      TopDoctorsDataModel topDoctorsDataModel = TopDoctorsDataModel.fromJson(response);
      log('Top Doctor Data ==>> ${topDoctorsDataModel.toJson()}');
      return topDoctorsDataModel;
    } catch (e) {
      rethrow;
    }
  }

  /// GET: TRUSTED HOSPITAL
  Future<TrustedHospitalDataModel> getTrustedHospital() async {
    try {
      Map<String, dynamic> response = await _apiService.get(getTrustedHospitalEndPoint);
      TrustedHospitalDataModel trustedHospitalDataModel = TrustedHospitalDataModel.fromJson(response);
      return trustedHospitalDataModel;
    } catch (e) {
      rethrow;
    }
  }

  /// PUT: TOGGLE DOCTOR LIKE
  Future<SuccessResponseModel> toggleDoctorLike(dynamic body) async {
    try {
      Map<String, dynamic> response = await _apiService.put(toggleDoctorLikeEndPoint, body);
      SuccessResponseModel successResponseModel = SuccessResponseModel.fromJson(response);
      log('Toggle Doctor Like ==>> ${successResponseModel.toJson()}');
      return successResponseModel;
    } catch (e) {
      rethrow;
    }
  }

  /// PUT: TOGGLE DOCTOR LIKE
  Future<SuccessResponseModel> toggleHospitalLike(dynamic body) async {
    try {
      Map<String, dynamic> response = await _apiService.put(toggleHospitalLikeEndPoint, body);
      SuccessResponseModel successResponseModel = SuccessResponseModel.fromJson(response);
      log('Toggle Hospital Like ==>> ${successResponseModel.toJson()}');
      return successResponseModel;
    } catch (e) {
      rethrow;
    }
  }

  /// GET: DOCTOR BY CATEGORY ID
  Future<DoctorByCategoryIdDataModel> getDoctorByCategoryId(String? categoryId) async {
    try {
      Map<String, dynamic> response = await _apiService.get('$getDoctorByCategoryIdEndPoint/$categoryId');
      DoctorByCategoryIdDataModel doctorByIdDataModel = DoctorByCategoryIdDataModel.fromJson(response);
      log('Doctor By Category Id ==>> ${doctorByIdDataModel.toJson()}');
      return doctorByIdDataModel;
    } catch (e) {
      rethrow;
    }
  }

  /// GET: DOCTOR BY ID
  Future<DoctorByIdModel> getDoctorById(String? doctorId) async {
    try {
      Map<String, dynamic> response = await _apiService.get('$getDoctorByIdEndPoint/$doctorId');
      DoctorByIdModel doctorByIdDataModel = DoctorByIdModel.fromJson(response);
      log('Doctor By Id ==>> ${doctorByIdDataModel.toJson()}');
      return doctorByIdDataModel;
    } catch (e) {
      rethrow;
    }
  }

  /// GET: HOSPITAL BY ID
  Future<HospitalByIdDataModel> getHospitalById(String? hospitalId) async {
    try {
      Map<String, dynamic> response = await _apiService.get('$getHospitalByIdEndPoint/$hospitalId');
      HospitalByIdDataModel hospitalByIdDataModel = HospitalByIdDataModel.fromJson(response);
      log('Hospital By Id ==>> ${hospitalByIdDataModel.toJson()}');
      return hospitalByIdDataModel;
    } catch (e) {
      rethrow;
    }
  }
}
