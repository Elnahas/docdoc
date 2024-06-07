import 'package:bloc/bloc.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/data/repos/home_repo.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecialization();

    response.when(success: (specializationsResponse) {
      emit(HomeState.specializationsSuccess(specializationsResponse));
    }, failure: (errorHandler) {
      emit(HomeState.specializationsError(errorHandler));
    });
  }
}
