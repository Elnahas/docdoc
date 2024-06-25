import 'package:flutter/material.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/ui/widgets/doctors_list/doctors_list_view_item.dart';
import '../../../data/model/specializations_response_model.dart';

class DoctorsListView extends StatelessWidget {
   final List<Doctors?>? doctorsList;
  const DoctorsListView({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context, index) {
          return  DoctorsListViewItem(doctorsModel:  doctorsList?[index]) ;
        },
      ),
    );
  }
}
