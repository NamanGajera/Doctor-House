import 'dart:developer';

import 'package:doctor_house/features/homeScreen/model/get_upcoming_schedule_data_model.dart';

import '../../features/auth/models/auth_model.dart';
import '../../features/homeScreen/model/doctor_category_data_model.dart';
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
}
