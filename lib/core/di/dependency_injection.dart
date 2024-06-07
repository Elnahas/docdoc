
import 'package:dio/dio.dart';
import 'package:flutter_advanced_omar_ahmed/core/networking/api_service.dart';
import 'package:flutter_advanced_omar_ahmed/core/networking/dio_factory.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/login/data/repos/login_repo.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/data/apis/home_api_service.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/logic/home_cubit.dart';

final getit = GetIt.instance;

Future<void> setupGetIt() async{
  //Dio And ApoService
  Dio dio = DioFactory.getDio();
  getit.registerLazySingleton<ApiService>(() => ApiService(dio));

  //Login
  getit.registerLazySingleton<LoginRepo>(()=> LoginRepo(getit()));
  getit.registerFactory<LoginCubit>(() => LoginCubit(getit()));

  //SignUp
  getit.registerLazySingleton<SignupRepo>(()=> SignupRepo(getit()));
  getit.registerFactory<SignupCubit>(() => SignupCubit(getit()));

  //home
  getit.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getit.registerLazySingleton<HomeRepo>(()=> HomeRepo(getit()));
  //getit.registerFactory<HomeCubit>(() => HomeCubit(getit()));


}