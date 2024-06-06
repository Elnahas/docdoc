import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_omar_ahmed/core/theming/styles.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          "Doctors Speciality",
          style: TextStyles.font18DarkBlueSemiBold
        ),
        const Spacer(),
        Text(
          "See All",
          style: TextStyles.font12BlueRegular
        ),
      ],
    );
  }
}