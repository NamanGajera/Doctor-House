import 'dart:developer';

import '../../features/auth/models/auth_model.dart';
import '../constants/api_end_point.dart';
import 'api_service.dart';

class ApiRepository {
  final ApiService _apiService;

  // Constructor-based dependency injection
  ApiRepository(this._apiService);

  Future<AuthModel> login(dynamic loginData) async {
    try {
      Map<String, dynamic> response = await _apiService.post(loginEndPoint, body: loginData);
      AuthModel authModel = AuthModel.fromJson(response);
      log("Login Data ==>> ${authModel.toJson()}");
      return authModel;
    } catch (e) {
      rethrow;
    }
  }
}
