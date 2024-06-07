import 'package:flutter/material.dart';
import 'package:flutter_advanced_omar_ahmed/core/helpers/spacing.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/ui/widgets/doctors_speciality_see_all.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/ui/widgets/specializations_and_doctors_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTopBar(),
            const DoctorsBlueContainer(),
            verticalSpace(24),
            const DoctorsSpecialitySeeAll(),
            verticalSpace(18),
            const SpecializationsAndDoctorsBlocBuilder()
          ],
        ),
      )),
    );
  }
}
