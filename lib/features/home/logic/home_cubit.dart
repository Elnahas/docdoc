import 'package:flutter_advanced_omar_ahmed/core/helpers/extentions.dart';
import 'package:flutter_advanced_omar_ahmed/core/networking/api_error_handler.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/data/model/specializations_response_model.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/data/repos/home_repo.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationsList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecialization();

    response.when(success: (specializationsResponse) {
      specializationsList =
          specializationsResponse.specializationDataList ?? [];

      getDoctorsList(specializationId: specializationsList?.first?.id);


      emit(HomeState.specializationsSuccess(specializationsList));
    }, failure: (errorHandler) {
      emit(HomeState.specializationsError(errorHandler));
    });
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? specializationDoctorsList =
        filterSpecializationListById(specializationId);

    if (!specializationDoctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(specializationDoctorsList));
    }
    else{
      emit(HomeState.doctorsError(ErrorHandler.handle("No doctors found for this specialization")));
    }
    
  }

  List<Doctors?>? filterSpecializationListById(int? specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
