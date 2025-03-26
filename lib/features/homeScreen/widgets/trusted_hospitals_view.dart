import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:doctor_house/features/homeScreen/bloc/home_screen_bloc.dart';
import 'package:doctor_house/routers/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../commonModel/hospital_details_data_model.dart';
import '../../../core/constants/images.dart';

class TrustedHospitalsView extends StatefulWidget {
  const TrustedHospitalsView({super.key});

  @override
  State<TrustedHospitalsView> createState() => _TrustedHospitalsViewState();
}

class _TrustedHospitalsViewState extends State<TrustedHospitalsView> {
  @override
  Widget build(BuildContext context) {
    /// Main container with horizontal scroll
    return SizedBox(
      height: 320,
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          return state.showTrustedHospitalLoader || state.trustedHospital == null
              ? shimmer()
              : (state.trustedHospital ?? []).isEmpty
                  ? const Text('No Data Found')
                  : ListView.builder(
                      itemCount: state.trustedHospital?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 16, left: 4, bottom: 12),
                      itemBuilder: (context, index) {
                        HospitalDetailsData? hospitalData = state.trustedHospital?[index];

                        /// Individual hospital card
                        return Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: context.isDarkTheme ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: context.isDarkTheme ? Colors.white38 : Colors.transparent,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Image section with rating and favorite button
                              Expanded(
                                flex: 7,
                                child: Stack(
                                  children: [
                                    /// Hospital image container
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(18),
                                          topRight: Radius.circular(18),
                                        ),
                                        image: const DecorationImage(
                                          image: AssetImage(hospitalSampleImage),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            blurRadius: 8,
                                          ),
                                        ],
                                      ),
                                    ),

                                    /// Favorite button
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: GestureDetector(
                                        onTap: () {
                                          context.read<HomeScreenBloc>().add(
                                                ToggleHospitalLikeEvent(
                                                  hospitalId: hospitalData?.id ?? '',
                                                  isLike: !(hospitalData?.isLiked ?? false),
                                                ),
                                              );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.1),
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            (hospitalData?.isLiked ?? false) ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                            color: (hospitalData?.isLiked ?? false) ? Colors.red : Colors.grey.shade600,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ),

                                    /// Rating badge
                                    Positioned(
                                      bottom: 8,
                                      right: 8,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              blurRadius: 4,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${hospitalData?.rating ?? ''}',
                                              style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// Hospital information section
                              Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        hospitalData?.name ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.local_hospital_rounded,
                                            color: Colors.blue.shade400,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 6),
                                          Expanded(
                                            child: Text(
                                              hospitalData?.hospitalType ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 13),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_rounded,
                                            color: Colors.blue.shade400,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 6),
                                          Expanded(
                                            child: Text(
                                              hospitalData?.address ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 13),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.phone_rounded,
                                            color: Colors.blue.shade400,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            '+91${hospitalData?.contactNumber ?? ''}',
                                            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).onTap(() {
                          context.push(hospitalDetailsScreenPath);
                        });
                      },
                    );
        },
      ),
    );
  }

  Widget shimmer() {
    return ListView.builder(
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(right: 16, left: 4, bottom: 12),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 200,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.transparent),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image section shimmer
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),

                // Specialist information section
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Doctor name shimmer
                        Container(
                          width: 120,
                          height: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 6),

                        // Specialty and experience tags
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Location information
                        Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Container(
                                height: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
