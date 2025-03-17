import 'dart:developer';

import '../../features/auth/models/auth_model.dart';
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
      return completeProfileModel;
    } catch (e) {
      rethrow;
    }
  }
}
