import 'package:doctor_house/core/constants/images.dart';
import 'package:flutter/material.dart';

class HospitalGalleryTabView extends StatefulWidget {
  const HospitalGalleryTabView({super.key});

  @override
  State<HospitalGalleryTabView> createState() => _HospitalGalleryTabViewState();
}

class _HospitalGalleryTabViewState extends State<HospitalGalleryTabView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            hospitalSampleImage,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
