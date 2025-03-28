import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/features/homeScreen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';

class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return state.showDoctorDataFetchLoader
            ? shimmer(context)
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.isDarkTheme ? Colors.black : Colors.white,
                  // border: context.isDarkTheme ? Border.all(color: Colors.white60) : null,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'doctor_image_tag${state.doctorData?.id}',
                      child: Container(
                        height: 100,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: context.isDarkTheme ? Colors.transparent : primaryBlueColor.withOpacity(0.4),
                            width: 1.5,
                          ),
                        ),
                        clipBehavior: Clip.hardEdge,
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
                          Text(
                            state.doctorData?.name ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: context.isDarkTheme ? primaryYellowColor.withOpacity(0.2) : primaryBlueColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              state.doctorData?.doctorType ?? '',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 14,
                                    color: context.isDarkTheme ? Colors.amber : primaryBlueColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: primaryBlueColor.withOpacity(0.6),
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  state.doctorData?.address ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  Widget shimmer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Shimmer for Doctor Image
          Shimmer.fromColors(
            highlightColor: Colors.grey.shade300,
            baseColor: Colors.grey.shade100,
            child: Container(
              height: 100,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shimmer for Doctor Name
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: Colors.grey.shade100,
                  child: Container(
                    height: 20,
                    width: 150,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: 8),
                // Shimmer for Speciality
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: Colors.grey.shade100,
                  child: Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      color: context.isDarkTheme ? Colors.grey[800] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Shimmer for Location
                Shimmer.fromColors(
                  highlightColor: Colors.grey.shade300,
                  baseColor: Colors.grey.shade100,
                  child: Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(width: 4),
                      Container(
                        height: 18,
                        width: 100,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
