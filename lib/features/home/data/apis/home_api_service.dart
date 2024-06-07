import 'package:dio/dio.dart';
import 'package:flutter_advanced_omar_ahmed/core/networking/api_constants.dart';
import 'package:retrofit/http.dart';

import '../model/specializations_response_model.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(ApiConstants.specializationEP)
  Future<SpecializationsResponseModel> getSpecialization();
}