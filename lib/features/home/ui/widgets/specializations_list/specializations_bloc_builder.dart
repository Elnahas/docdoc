import 'package:flutter/material.dart';
import 'package:flutter_advanced_omar_ahmed/core/helpers/spacing.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/logic/home_cubit.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/logic/home_state.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/ui/widgets/specializations_list/speciality_list_view.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/ui/widgets/specializations_list/speciality_shimmer_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

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
              return setupSuccess(specializationsResponseModel);
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
    return Expanded(
      child: Column(children: [
        const SpecialityShimmerLoading(),
        verticalSpace(8),
        const DoctorsShimmerLoading(),
      ],),
    );
  }

  Widget setupError(String error) {
    return  Text(error);
  }

  Widget setupSuccess(specializationsList){
    return SpecialityListView(
        specializationsDataList: specializationsList ?? []);
  }
}
