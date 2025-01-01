import 'package:doctor_house/core/constants/colors.dart';
import 'package:doctor_house/core/constants/widgets.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/screens/doctorDetailsScreen/widgets/doctor_about_view.dart';
import 'package:doctor_house/screens/doctorDetailsScreen/widgets/doctor_profile_view.dart';
import 'package:doctor_house/screens/doctorDetailsScreen/widgets/doctor_stats_view.dart';
import 'package:doctor_house/screens/doctorDetailsScreen/widgets/doctor_working_hours.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctor Details',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12),
            DoctorProfileView(),
            SizedBox(height: 12),
            DoctorStatsView(),
            SizedBox(height: 18),
            DoctorAboutView(),
            SizedBox(height: 18),
            DoctorWorkingHours(),
            SizedBox(height: 32),
            CustomButton(
              label: 'Book Appointment',
              textColor: Colors.white,
              onPressed: () {},
              width: double.infinity,
              color: primaryBlueColor,
              borderRadius: 12,
              padding: EdgeInsets.symmetric(vertical: 9),
            ).withPadding(EdgeInsets.symmetric(horizontal: 18)),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
