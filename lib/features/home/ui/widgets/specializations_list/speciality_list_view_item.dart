import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/model/specializations_response_model.dart';

class SpecialityListViewItem extends StatelessWidget {

  final int index;
  final int selectedSpecializationIndex;
  final SpecializationsData? specializationsData;
  
  const SpecialityListViewItem({super.key, required this.index, this.specializationsData ,  required this.selectedSpecializationIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                index == selectedSpecializationIndex?
                Container(
                  decoration:  BoxDecoration(
                    border: Border.all(color: ColorsManager.darkBlue),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    'assets/svgs/general_speciality.svg',
                    height: 42.h,
                    width: 42.w,
                  ),
                ) ,
                )
                
                :
                
                CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    'assets/svgs/general_speciality.svg',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
                verticalSpace(8),
                Text(
                  specializationsData?.name ?? 'Specializations',
                  style: index == selectedSpecializationIndex? TextStyles.font14DarkBlueMedium : TextStyles.font12DarkBlueRegular,
                ),
              ],
            ),
          );
  }
}