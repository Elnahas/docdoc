
import 'package:dio/dio.dart';
import 'package:flutter_advanced_omar_ahmed/core/networking/api_service.dart';
import 'package:flutter_advanced_omar_ahmed/core/networking/dio_factory.dart';
import 'package:flutter_advanced_omar_ahmed/features/login/data/repos/login_repo.dart';
import 'package:flutter_advanced_omar_ahmed/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

Future<void> setupGetIt() async{
  //Dio And ApoService
  Dio dio = DioFactory.getDio();
  getit.registerLazySingleton<ApiService>(() => ApiService(dio));

  //Login
  getit.registerLazySingleton<LoginRepo>(()=> LoginRepo(getit()));
  getit.registerLazySingleton<LoginCubit>(() => LoginCubit(getit()));

}