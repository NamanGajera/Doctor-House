import 'package:doctor_house/features/homeScreen/bloc/home_screen_bloc.dart';
import 'package:doctor_house/features/hospitalDetailsScreen/widgets/hospital_details_tab_bar_view.dart';
import 'package:doctor_house/features/hospitalDetailsScreen/widgets/hospital_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalDetailsScreen extends StatefulWidget {
  final String hospitalId;

  const HospitalDetailsScreen({super.key, required this.hospitalId});

  @override
  State<HospitalDetailsScreen> createState() => _HospitalDetailsScreenState();
}

class _HospitalDetailsScreenState extends State<HospitalDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeScreenBloc>().add(GetHospitalByIdEvent(hospitalId: widget.hospitalId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverToBoxAdapter(child: HospitalHeader()),
          ],
          body: const HospitalTabView(),
        ),
      ),
    );
  }
}
