import 'package:doctor_house/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../commonModel/category_data_model.dart';
import '../bloc/home_screen_bloc.dart';

class DoctorCategoryListView extends StatefulWidget {
  const DoctorCategoryListView({super.key});

  @override
  State<DoctorCategoryListView> createState() => _DoctorCategoryListViewState();
}

class _DoctorCategoryListViewState extends State<DoctorCategoryListView> {
  List<String> docTypeName = [
    'Dermatologist',
    'Gynecology',
    'Nephrologist',
    'Neurologist',
    'Ophthalmologist',
    'Dentist',
    'Orthopedics',
    'Pediatrician',
    'Psychiatrist',
    'Pulmonologist',
    'Urologist',
  ];
  List<String> docTypeIcon = [
    dermatologistIcon,
    gynecologyIcon,
    nephrologistIcon,
    neurologistIcon,
    ophthalmologistsIcon,
    dentistIcon,
    orthopedicsIcon,
    pediatricianIcon,
    psychiatristIcon,
    pulmonologistIcon,
    urologistIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return SizedBox(
          height: 120,
          child: state.showCategoryLoader
              ? shimmer()
              : ListView.builder(
                  itemCount: state.doctorCategoryData?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    CategoryData? category = state.doctorCategoryData?[index];
                    return Container(
                      width: 90,
                      margin: const EdgeInsets.only(right: 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomDoctorIconContainer(
                            iconPath: category?.image ?? '',
                            isNetworkImage: true,
                            height: 32,
                            width: 32,
                            borderRadius: 16,
                            padding: 14,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            category?.name ?? '',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  fontSize: 11,
                                ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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

  Widget shimmer() {
    return ListView.builder(
      itemCount: 5, // Show 5 shimmer items while loading
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 90,
            margin: const EdgeInsets.only(right: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Shimmer for icon container
                Container(
                  height: 60, // Combined height of icon + padding
                  width: 60, // Combined width of icon + padding
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(height: 10),
                // Shimmer for text
                Container(
                  height: 11, // Same as your font size
                  width: 70, // Width for the text placeholder
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
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

class CustomDoctorIconContainer extends StatelessWidget {
  final String iconPath;
  final double height;
  final double width;
  final double padding;
  final Color backgroundColor;
  final double borderRadius;
  final bool isNetworkImage;

  const CustomDoctorIconContainer({
    super.key,
    required this.iconPath,
    this.height = 23.0,
    this.width = 23.0,
    this.padding = 5.0,
    this.backgroundColor = const Color(0xFFF5F7FF),
    this.borderRadius = 20.0,
    this.isNetworkImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width + (padding * 2),
      height: height + (padding * 2),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.blue.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: isNetworkImage
            ? FadeInImage.assetNetwork(
                placeholder: dermatologistIcon,
                image: iconPath,
                height: height,
                width: width,
                fit: BoxFit.contain,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    dermatologistIcon,
                    height: height,
                    width: width,
                    fit: BoxFit.contain,
                  );
                },
              )
            : Image.asset(
                iconPath,
                height: height,
                width: width,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
