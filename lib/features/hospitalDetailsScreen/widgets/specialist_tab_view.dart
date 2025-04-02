import 'package:doctor_house/commonModel/doctor_details_data_model.dart';
import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/features/homeScreen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';

class SpecialistTabView extends StatefulWidget {
  const SpecialistTabView({super.key});

  @override
  State<SpecialistTabView> createState() => _SpecialistTabViewState();
}

class _SpecialistTabViewState extends State<SpecialistTabView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: state.hospitalData?.doctors?.length ?? 0,
            itemBuilder: (context, index) {
              DoctorDetailsData? doctorData = state.hospitalData?.doctors?[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: context.isDarkTheme ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: context.isDarkTheme ? Border.all(color: Colors.white54) : null,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            height: 110,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xff50507D).withOpacity(0.1),
                                  const Color(0xff50507D).withOpacity(0.2),
                                ],
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                doctorSampleImage,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      doctorData?.name ?? '-',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context.read<HomeScreenBloc>().add(ToggleDoctorLikeEvent(
                                              doctorId: doctorData?.id ?? '',
                                              isLike: !(doctorData?.isLiked ?? false),
                                            ));
                                      },
                                      child: Icon(
                                        (doctorData?.isLiked ?? false) ? Icons.favorite : Icons.favorite_border,
                                        color: (doctorData?.isLiked ?? false) ? Colors.red : Colors.grey,
                                        size: 22,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  doctorData?.doctorType ?? '-',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 13),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        doctorData?.experience ?? '-',
                                        style: TextStyle(
                                          color: Colors.blue[700],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.amber, size: 18),
                                        Text(
                                          '${doctorData?.rating ?? '-'}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          ' (1.5K)',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: context.isDarkTheme ? Colors.white60 : Colors.grey[600],
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        doctorData?.address ?? '-',
                                        style: Theme.of(context).textTheme.labelLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 46,
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: primaryDarkBlueColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 18,
                            color: Colors.white70,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Book Appointment',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
