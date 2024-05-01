import 'package:flutter_advanced_omar_ahmed/core/networking/api_error_handler.dart';
import 'package:flutter_advanced_omar_ahmed/core/networking/api_result.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/sign_up/data/models/sign_up_response.dart';

import '../../../../../core/networking/api_service.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.register(signupRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}