import 'package:flutter/material.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/ui/widgets/doctors_speciality_list_view_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/model/specializations_response_model.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationsDataList;
  const DoctorsSpecialityListView(
      {super.key, required this.specializationsDataList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsDataList.length,
        itemBuilder: (context, index) {
          return DoctorsSpecialityListViewItem(
            index: index,
            specializationsData: specializationsDataList[index],
          );
        },
      ),
    );
  }
}
