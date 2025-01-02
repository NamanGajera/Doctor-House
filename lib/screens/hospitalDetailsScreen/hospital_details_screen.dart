import 'package:doctor_house/screens/hospitalDetailsScreen/widgets/hospital_details_tab_bar_view.dart';
import 'package:doctor_house/screens/hospitalDetailsScreen/widgets/hospital_header.dart';
import 'package:flutter/material.dart';

class HospitalDetailsScreen extends StatelessWidget {
  const HospitalDetailsScreen({super.key});

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
