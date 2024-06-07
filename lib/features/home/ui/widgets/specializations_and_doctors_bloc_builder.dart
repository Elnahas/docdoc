import 'package:flutter/material.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/logic/home_cubit.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/logic/home_state.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/ui/widgets/doctors_list_view.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is SpecializationsLoading ||
            current is SpecializationsSuccess ||
            current is SpecializationsError,
        builder: (context, state) {
          return state.maybeWhen(
            specializationsLoading: () {
              return setupLoading();
            },
            specializationsSuccess: (specializationsResponseModel) {
              var specializationsList =
                  specializationsResponseModel.specializationDataList;
              return setupSuccess(specializationsList);
            },
            specializationsError: (error) {
              return const Text('Error');
            },
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        });
  }

  Widget setupLoading(){
    return const CircularProgressIndicator();
  }

  Widget setupError(String error) {
    return  Text(error);
  }

  Widget setupSuccess(specializationsList){
    return Expanded(
                child: Column(
                  children: [
                    DoctorsSpecialityListView(
                        specializationsDataList: specializationsList ?? []),
                    verticalSpace(8),
                    DoctorsListView(
                      doctorsList: specializationsList?[0]?.doctorsList,
                    ),
                  ],
                ),
              );
  }
}
