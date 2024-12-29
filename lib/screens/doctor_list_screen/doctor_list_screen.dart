import 'package:doctor_house/core/constants/colors.dart';
import 'package:doctor_house/core/extension/build_context_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../core/constants/images.dart';

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({super.key});

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  TextEditingController searchController = TextEditingController();
  int selectedSpeciality = 0;
  Set<int> favoriteDoctors = {};

  List<String> docTypeName = [
    'All',
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search doctors, specialities...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  filled: true,
                  fillColor: context.isDarkTheme ? Colors.black : Colors.white,
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
            SizedBox(
              height: 48,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: docTypeName.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedSpeciality == index;
                  return GestureDetector(
                    onTap: () => setState(() => selectedSpeciality = index),
                    child: Container(
                      margin: EdgeInsets.only(right: 8, bottom: 6),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Color(0xff50507D)
                            : context.isDarkTheme
                                ? Colors.black
                                : Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: context.isDarkTheme ? Border.all(color: primaryDarkBlueColor) : null,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        docTypeName[index],
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
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: context.isDarkTheme ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: context.isDarkTheme ? Border.all(color: Colors.white54) : null,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
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
                                      Color(0xff50507D).withOpacity(0.1),
                                      Color(0xff50507D).withOpacity(0.2),
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
                                          'Dr. Suresh Sharma',
                                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (favoriteDoctors.contains(index)) {
                                                favoriteDoctors.remove(index);
                                              } else {
                                                favoriteDoctors.add(index);
                                              }
                                            });
                                          },
                                          child: Icon(
                                            favoriteDoctors.contains(index) ? Icons.favorite : Icons.favorite_border,
                                            color: favoriteDoctors.contains(index) ? Colors.red : Colors.grey,
                                            size: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      'Orthopedic Surgeon',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 13),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.blue[50],
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            '10+ years',
                                            style: TextStyle(
                                              color: Colors.blue[700],
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Row(
                                          children: [
                                            Icon(Icons.star, color: Colors.amber, size: 18),
                                            Text(
                                              ' 4.8',
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
                                            'City Hospital, Ahmedabad',
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
                          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: primaryDarkBlueColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Row(
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
        ),
      ),
    );
  }
}
