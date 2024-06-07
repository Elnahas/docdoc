import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/model/specializations_response_model.dart';

class DoctorsSpecialityListViewItem extends StatelessWidget {

  final int index;
  final SpecializationsData? specializationsData;
  
  const DoctorsSpecialityListViewItem({super.key, required this.index, this.specializationsData});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
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
                  style: TextStyles.font12DarkBlueRegular,
                ),
              ],
            ),
          );
  }
}