import 'package:flutter_advanced_omar_ahmed/core/networking/api_error_handler.dart';
import 'package:flutter_advanced_omar_ahmed/core/networking/api_result.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/login/data/models/login_request_body.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/login/data/models/login_response.dart';

import '../../../../../core/networking/api_service.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final respons = await _apiService.login(loginRequestBody);
      return ApiResult.success(respons);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
