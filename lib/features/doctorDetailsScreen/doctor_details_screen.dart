import 'dart:developer';

import 'package:doctor_house/core/constants/colors.dart';
import 'package:doctor_house/core/constants/widgets.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/features/doctorDetailsScreen/widgets/doctor_about_view.dart';
import 'package:doctor_house/features/doctorDetailsScreen/widgets/doctor_profile_view.dart';
import 'package:doctor_house/features/doctorDetailsScreen/widgets/doctor_stats_view.dart';
import 'package:doctor_house/features/doctorDetailsScreen/widgets/doctor_working_hours.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../homeScreen/bloc/home_screen_bloc.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final String doctorId;

  const DoctorDetailsScreen({super.key, required this.doctorId});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  void initState() {
    super.initState();
    log('Doctor Id ==>>  ${widget.doctorId}');
    context.read<HomeScreenBloc>().add(GetDoctorByIdEvent(doctorId: widget.doctorId));
  }

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
            const SizedBox(height: 12),
            const DoctorProfileView(),
            const SizedBox(height: 12),
            const DoctorStatsView(),
            const SizedBox(height: 18),
            const DoctorAboutView(),
            const SizedBox(height: 18),
            const DoctorWorkingHours(),
            const SizedBox(height: 32),
            BlocBuilder<HomeScreenBloc, HomeScreenState>(
              builder: (context, state) {
                return state.showDoctorDataFetchLoader
                    ? const SizedBox.shrink()
                    : CustomButton(
                        label: 'Book Appointment',
                        textColor: Colors.white,
                        onPressed: () {
                          context.push(bookAppointmentScreenPath);
                        },
                        width: double.infinity,
                        color: primaryBlueColor,
                        borderRadius: 12,
                        padding: const EdgeInsets.symmetric(vertical: 9),
                      );
              },
            ).withPadding(const EdgeInsets.symmetric(horizontal: 18)),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
