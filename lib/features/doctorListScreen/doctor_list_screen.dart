import 'dart:developer';

import 'package:doctor_house/commonModel/doctor_details_data_model.dart';
import 'package:doctor_house/core/constants/colors.dart';
import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:doctor_house/features/homeScreen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shimmer/shimmer.dart';

import '../../commonModel/category_data_model.dart';
import '../../core/constants/images.dart';

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({super.key});

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  TextEditingController searchController = TextEditingController();

  List<CategoryData> docCategoryData = [
    CategoryData(
      name: 'All',
      id: "1",
    ),
  ];

  @override
  void initState() {
    super.initState();
    docCategoryData.addAll(context.read<HomeScreenBloc>().state.doctorCategoryData ?? []);
    context.read<HomeScreenBloc>().add(GetDoctorDataByCategoryIdEvent(categoryId: null));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Top Specialists',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: KeyboardDismissOnTap(
        dismissOnCapturedTaps: true,
        child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            return Column(
              children: [
                /// Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search doctors, specialities...',
                      prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                      filled: true,
                      fillColor: context.isDarkTheme ? Colors.black : Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: context.isDarkTheme
                            ? const BorderSide(
                                color: Colors.white70,
                              )
                            : BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                /// Category List
                SizedBox(
                  height: 48,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: docCategoryData.length,
                    itemBuilder: (context, index) {
                      CategoryData category = docCategoryData[index];
                      final isSelected = state.selectedDoctorCategoryId == category.id;
                      return GestureDetector(
                        onTap: () {
                          log('Selected Category Id ==>> ${category.id}');
                          context.read<HomeScreenBloc>().add(SelectDoctorCategoryEvent(categoryId: category.id));
                          context.read<HomeScreenBloc>().add(GetDoctorDataByCategoryIdEvent(categoryId: category.id));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8, bottom: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xff50507D)
                                : context.isDarkTheme
                                    ? Colors.black
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: context.isDarkTheme ? Border.all(color: primaryDarkBlueColor) : null,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            category.name ?? '',
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : context.isDarkTheme
                                      ? Colors.white70
                                      : Colors.grey[800],
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),

                /// Doctor Data List
                Expanded(
                  child: state.showDoctorCategoryDataLoader || state.doctorDataByCategoryId == null
                      ? shimmer()
                      : (state.doctorDataByCategoryId ?? []).isEmpty
                          ? const Center(child: Text('No Data Found'))
                          : ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: state.doctorDataByCategoryId?.length ?? 0,
                              itemBuilder: (context, index) {
                                DoctorDetailsData? doctorData = state.doctorDataByCategoryId?[index];
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
                                                        doctorData?.name ?? '',
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
                                                    doctorData?.doctorType ?? '',
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
                                                          doctorData?.experience ?? '',
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
                                                          const Icon(Icons.star, color: Colors.amber, size: 18),
                                                          Text(
                                                            ' ${doctorData?.rating ?? ''}',
                                                            style: const TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          const Text(
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
                                                          '${doctorData?.address}',
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget shimmer() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 10,
      itemBuilder: (context, index) {
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
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 110,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
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
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 120,
                                  height: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: const Icon(Icons.favorite_border, size: 22, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 100,
                              height: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 60,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 50,
                                  height: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: const Icon(Icons.location_on, size: 16, color: Colors.grey),
                              ),
                              const SizedBox(width: 4),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 140,
                                  height: 14,
                                  color: Colors.white,
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
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: double.infinity,
                  height: 46,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
