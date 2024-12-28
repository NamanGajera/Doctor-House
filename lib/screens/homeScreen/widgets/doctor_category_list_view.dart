import 'package:doctor_house/core/constants/images.dart';
import 'package:flutter/material.dart';

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
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: docTypeIcon.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: 90,
            margin: const EdgeInsets.only(right: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomDoctorIconContainer(
                  iconPath: docTypeIcon[index],
                  height: 32,
                  width: 32,
                  borderRadius: 16,
                  padding: 14,
                ),
                const SizedBox(height: 10),
                Text(
                  docTypeName[index],
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
  }
}

class CustomDoctorIconContainer extends StatelessWidget {
  final String iconPath;
  final double height;
  final double width;
  final double padding;
  final Color backgroundColor;
  final double borderRadius;

  const CustomDoctorIconContainer({
    super.key,
    required this.iconPath,
    this.height = 23.0,
    this.width = 23.0,
    this.padding = 5.0,
    this.backgroundColor = const Color(0xFFF5F7FF),
    this.borderRadius = 20.0,
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
        child: Image.asset(
          iconPath,
          height: height,
          width: width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
