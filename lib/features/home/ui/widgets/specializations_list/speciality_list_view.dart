import 'package:flutter/material.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/logic/home_cubit.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/ui/widgets/specializations_list/speciality_list_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/model/specializations_response_model.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationsData?> specializationsDataList;
  const SpecialityListView(
      {super.key, required this.specializationsDataList});

  @override
  State<SpecialityListView> createState() =>
      _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecializationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });

              context.read<HomeCubit>().getDoctorsList(
                  specializationId: widget.specializationsDataList[index]?.id);
            },
            child: SpecialityListViewItem(
              index: index,
              specializationsData: widget.specializationsDataList[index],
              selectedSpecializationIndex: selectedSpecializationIndex,
            ),
          );
        },
      ),
    );
  }
}
